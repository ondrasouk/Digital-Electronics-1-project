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
### Popis problému s Měřením času
Čidlo vždy vygeneruje klesající hranu, když kolem něj projede magnet umístěný na kole setrvačníku. V topu vstup ale invertujeme, pro snažší pochopení. Tento signál značí jednu otáčku setrvačníku, který simuluje setrvačnost jízdního kola a člověka na něm. Interval mezi klesajícími hrany tedy je doba za kterou virtuální kolo urazí jednu otočku kola. Podle vzorečku v=s/t můžeme vypočítat rychlost, kde s je virtuální vzdálenost jedné otočky setrvačníku (je tedy konstantní) a t je čas mezi signálem ze senzoru.  
K měření času se dá použít hodinový zdroj z FPGA který má 100&nbsp;MHz. Rozlišovací schopnost 10&nbsp;ns je pro toto použití moc přesná a plítvali bychom zbytečně prostředky na např. 32 bitovém čitači, když můžeme použít 16 bitový. Tedy aby pro čas kolem 250&nbsp;us se musí prodloužit interval mezi náběžnými hranami. Pro tento účel se použije dělička časových hodin v podobě modulu clock_enable, který máme z dřívějších cvičení. Poté něčím musíme počítat jednotlivé pulzy, pro toto použijeme také ze cvičení naprogramovaný obousměrný čítač, který pro tento účel zjednodušíme a uděláme z něj jen jednoduchý čítač nahoru. Nasčítaný počet pulzů tedy odpovídá času, který trvala jedna otočka setrvačníku. Pro vyšší přesnost se při každé otočce vyresetuje i modul clock_enable.
#### Náhled do bloku s instancemi clock_aneble a cnt_up a procesu etime (elapsed time)
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
        end if;
    end process p_etime;
```
#### Popis kódu
TODO

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
