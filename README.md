# Týmový projekt do předmětu BPC-DE1 
# Název projektu: Konzole pro rotoped 

### Členové týmu

1. [Smejkal Marek](https://github.com/xsmejk30/Digital-electronics-1)
2. [Socha Jakub](https://github.com/xsocha00/Digital-electronics-1)
3. [Soukeník Ondřej](https://github.com/ondrasouk/Digital-electronics-1)
4. [Stupka Tomáš](https://github.com/ondrasouk/Digital-electronics-1)
5. [Šomšák Martin ](https://github.com/MartinSomsak00/DE1)

[Link to GitHub project folder](https://github.com/ondrasouk/Digital-Electronics-1-project)

## Úvod

Úkolem tohoto projektu bylo vytvořit konzoli pro měření otáček rotopedu. Toto měření následně vede na rozšíření jako napříkad měření rychlosti, ujeté vzdálenosti, průměrné rychlosti atd. 

V našem případě jsme se rozhodli pro snímání otáček použít čidlo [44E](https://dratek.cz/arduino/7735-halluv-senzor-44e.html?gclid=CjwKCAjwj6SEBhAOEiwAvFRuKIS_8uQ_ZEzr9x-yYRR3fPEQ0RS04KZdMaqaGm8xElUVrgnHnGZ3SxoCdZ4QAvD_BwE), který obsahuje halovu sondu. Napájecí napětí čidla je 4,5-24V Výstupem čidla je buď logická 0 nebo 1. Pokud tento sensor umístíme na pevný bod v blízkoti otáčenícího kola, je nutné přidat na otáčejí se kole magnetický puk. Následně při otáčení kola snímač vygeneruje signál pomocí kterého můžeme určit požadované veličiny.

Pro následní zobrazení měřené veličiny byl využit 4x7 segmentový displej a tři ledky pro indikaci zobrazovaného výstupu (zapnuto/vypnuto, přepínání zobrazení, reset systému).

## Popis zapojení 
TODO

## Programová část
### Popis řešení měření času
Čidlo vždy vygeneruje klesající hranu, když kolem něj projede magnet umístěný na kole setrvačníku. V topu vstup ale invertujeme, pro snažší pochopení. Tento signál značí jednu otáčku setrvačníku, který simuluje setrvačnost jízdního kola a člověka na něm. Interval mezi klesajícími hrany tedy je doba za kterou virtuální kolo urazí jednu otočku kola. Podle vzorečku v=s/t můžeme vypočítat rychlost, kde s je virtuální vzdálenost jedné otočky setrvačníku (je tedy konstantní) a t je čas mezi signálem ze senzoru.

K měření času se dá použít hodinový zdroj z FPGA který má 100&nbsp;MHz. Rozlišovací schopnost 10&nbsp;ns je pro toto použití moc přesná a plítvali bychom zbytečně prostředky na např. 32 bitovém čitači, když můžeme použít 16 bitový. Tedy aby pro čas kolem 250&nbsp;us se musí prodloužit interval mezi náběžnými hranami. Pro tento účel se použije dělička časových hodin v podobě modulu clock_enable, který máme z dřívějších cvičení. Poté něčím musíme počítat jednotlivé pulzy, pro toto použijeme také ze cvičení naprogramovaný obousměrný čítač, který pro tento účel zjednodušíme a uděláme z něj jen jednoduchý čítač nahoru. Nasčítaný počet pulzů tedy odpovídá času, který trvala jedna otočka setrvačníku. Pro vyšší přesnost se při každé otočce vyresetuje i modul clock_enable.
#### Náhled do bloku s instancemi `clock_enable` a `cnt_up` a procesu `p_etime` (elapsed time)
```vhdl
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en1 : entity work.clock_enable
        generic map(
            g_MAX => g_TIME_UNIT_LENGHT
        )
        port map(
            clk => clk,
            reset => s_rst_t,
            ce_o => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up entity
    bin_cnt0 : entity work.cnt_up
        generic map(
            g_CNT_WIDTH => 16
        )
        port map(
            clk => clk,
            reset => s_rst_t,
            en_i => s_en,
            cnt_o => s_etime
        );

    --------------------------------------------------------------------
    -- p_etime:
    -- Measure elapsed time using clock divider and counter.
    --------------------------------------------------------------------
    p_etime : process(clk,hall_sensor_i,reset)
    begin
        if reset = '1' then
            s_rst_t <= '1';
            s_etime_local <= (others => '0');
            s_distance_local <= (others => '0');
            s_skip <= '1';
        elsif rising_edge(clk) and ((s_rst_t = '1') and (s_etime = x"0000")) then
            s_rst_t <= '0'; -- on the next clock take down the reset for timer
        elsif rising_edge(hall_sensor_i) and (s_skip = '1') then
            s_rst_t <= '1';
            s_skip <= '0';
        elsif rising_edge(hall_sensor_i) and not(s_etime = x"0000") then
            s_etime_local <= unsigned(s_etime);
            s_distance_local <= s_distance_local + 1;
            s_rst_t <= '1'; -- reset the timer and clock divider
        elsif (rising_edge(clk) and (unsigned(s_etime) > g_ETIME_ZERO)) then
            s_etime_local <= (others => '0');
            s_skip <= '1';
        end if;
    end process p_etime;
```
#### Popis kódu
Proces p_etime má za úkol měřit čas, počítat vstupní hodnoty, přiřazovat naměřený čas do signálu `s_etime_local` a posílat signál `s_rst_t` a tím resetovat `clk_en1` a `bin_cnt0`. Reset proběhne vždy když příjde náběžná hrana z hallova senzoru. Také se musí kontrolovat, jestli už neuplynula moc dlouhá doba od posledního vstupu a v případě potřeby vynulovat čas v signálu `s_etime`. V tomto případě je potřeba přeskočit další měření, kdeby mohla kvůli jedoucímu čítači přetéct maximální hodnota času (0.1*2^16&nbsp;ms&nbsp;=&nbsp;6.5536&nbsp;s) a mohlo by to odečíst špatnou hodnotu. Pro tento účel je zde signál `s_skip`, který zaručí, že při další náběžné hraně se aktuální hodnota nebude měřit a jen proběhne reset čítače a děliče. Lokální reset `s_rst_t` trvá do dalšího clocku a dokud není vyresetovaný čitač. Při globálním resetu se vyresetuje vše a nastaví se `s_skip`, aby to další náběžnou hranu nepočítalo. 

### Počítání rychlosti, vzdálenosti a energie
Rychlost se počítá pomocí vzorečku v=s/t. Tedy v\[*dm/s*\]&nbsp;=&nbsp;`g_WHEEL_CIRCUMFERENCE`\[*cm*\]/`s_etime`\[*ms/10*\]. Vzdálenost se počítá podle otočení setrvačníku násobeného obvodem virtuálního kola (`g_WHEEL_CIRCUMFERENCE`).

Energie mezi otočením se dá rozdělit na rozdíl kinetických energií mezi otečením a aktuálnímu odporu (zátěže) potřebné pro jedno otočení. Kinetická energie se spočítá jako Eₖ&nbsp;=&nbsp;1/2&nbsp;J&nbsp;ω². Práce je součet vykonané energie, tedy pokud budeme počítat jednotlivé díly jak roste, tak dojdeme k celkové energii. Design programu je tímto připraven například na měření okamžitého výkonu.

Pro zátěž počítáme s teoretickou, která bude sestávat jen z práce potřebné pro jednu otočku tedy čím vyšší úhlová rychlost, tím vyšší odpor. Výpočet Wₒ&nbsp;=&nbsp;2π F<sub>b</sub> .
V Programu se jedná o `g_RESISTLOAD` a o `g_INERTIA_MOMENT`, kde `g_INERTIA_MOMENT` musí být vynásoben 10000π, aby odpovídal jednotkám SI.

#### Náhled na kód procesu `p_calc` a přiřazení dat výstupním signálům
```vhdl
    --------------------------------------------------------------------
    -- p_calc:
    -- Calculate actual speed (average of last four speeds).
    -- Also monitor maximal speed, calories in total.
    --------------------------------------------------------------------
    p_calc : process(hall_sensor_i,reset,s_etime_local)
    begin
        if falling_edge(reset) then
            s_speed_local <= (others => '0');
            s_speed1_local <= (others => '0');
            s_speed2_local <= (others => '0');
            s_speed3_local <= (others => '0');
            s_avg_speed_local <= (others => '0');
            s_max_speed_local <= (others => '0');
            s_inertia_local <= (others => '0');
            s_inertia1_local <= (others => '0');
            s_work_local <= (others => '0');
        elsif (s_etime_local = x"0000") and not (reset = '1') then --flywheel is stopped
            s_speed_local <= (others => '0');
            s_speed1_local <= (others => '0');
            s_speed2_local <= (others => '0');
            s_speed3_local <= (others => '0');
            s_avg_speed_local <= (others => '0');
            s_inertia_local <= (others => '0');
        elsif rising_edge(hall_sensor_i) and not (reset = '1') then
            s_speed3_local <= s_speed2_local;
            s_speed2_local <= s_speed1_local;
            s_speed1_local <= s_speed_local;
            s_speed_local <= (g_WHEEL_CIRCUMFERENCE*10000/resize(s_etime_local, 22)); -- m*1e-6/s*1e-4=cm/s
            s_avg_speed_local <= resize(resize(s_speed_local+s_speed1_local+s_speed2_local+s_speed3_local, 24)/4, 22);
            if (s_max_speed_local < s_avg_speed_local) then
                s_max_speed_local <= s_avg_speed_local;
            end if;
            s_inertia1_local <= s_inertia_local;
            s_inertia_local <= resize(g_INERTIA_MOMENT/((s_etime_local * s_etime_local)/5000), 16);
            s_work_local <= s_work_local + s_inertia_local - s_inertia1_local + g_RESISTLOAD; -- in Joules
        end if;
    end process p_calc;
    
    speed_o <= std_logic_vector(resize(resize(s_avg_speed_local*36, 26)/10, 22));
    max_speed_o <= std_logic_vector(resize(resize(s_max_speed_local*36, 26)/10, 22));
    distance_o <= std_logic_vector(resize(resize(s_distance_local * g_WHEEL_CIRCUMFERENCE, 30) / 100, 22));
    calories_o <= std_logic_vector(resize(resize(s_work_local*1000, 26)/4184, 22)); -- 1cal = 4.184 Joules
```
#### Popis kódu
Proces `p_calc` v normálním chodu (není nastaven `reset` ani `s_etime_local` není vynulovaný) nejprve přesune všechny důležité hodnoty z minulých běhů a uvolní tak místo pro aktuální hodnotu rychlosti `s_speed_local`, poté se vypočítá průměr čtyř předchozích rychlostí `s_avg_speed_local` a vyzkouší se, jestli to není nová nejvyšší rychlost `s_max_speed_local`. Poté se uloží minulá kinetická energie a vypočítá se aktuální. `s_work_local` je dosavadní práce, rozdíl kinetických energií setrvačníku a přičtení `g_RESISTLOAD`, protože setrvačník udělal jedno otočení. Signál `reset` vynuluje všechny lokální proměnné používané tímto procesem. V případě že reset není nastaven, ale čas mezi pulsy je na nule, tedymoc dlouho se čekalo na další pulz z hallova senzoru se vynulují rychlosti a kinetická energie, tedy setrvačník se virtuálně zastaví. Tento stav se musí ošetřovat zvlášť, protože dělit nulou nemůžeme a nejvyšší možná hodnota `s_etime` se neblíží nekonečnu, hlavně 2500000 > 2^16, tedy nikdy nevýjde nula i s tím, že dělení ve VHDL zaokrouhluje vždy dolů.

Přiřazování hodnot je jen převod na jednotky vhodnější k použití v displeji. Např. z *cm/s* převádíme do desítek metrů za hodinu (násobíme 3.6). Vzdálenost je násobení počtu otočení setrvačníku a obvodu virtuálního kola, kde výsledek je v metrech. Jouly převádíme na kalorie, které jsou větší a častěji se používají na cvičících strojích, kde jsou v kilokaloriích.

### Simulace 

TODO


## Video
*Přidat*
[Link na video prezentace]()


## Reference

   1. [https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board/](https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board/)
   2. [https://reference.digilentinc.com/reference/programmable-logic/arty-a7/reference-manual](https://reference.digilentinc.com/reference/programmable-logic/arty-a7/reference-manual)
   3. [arty_a7_sch.pdf](Docs/arty_a7_sch.pdf)
   4. [44E datasheet](https://dratek.cz/docs/produkty/0/908/a3144eu.pdf)
   
TODO
