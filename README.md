# Týmový projekt do předmětu BPC-DE1 
# Název projektu: Konzole pro rotoped 

### Team members

1. [Smejkal Marek](https://github.com/xsmejk30/Digital-electronics-1)
2. [Socha Jakub](https://github.com/xsocha00/Digital-electronics-1)
3. [Soukeník Ondřej](https://github.com/ondrasouk/Digital-electronics-1)
4. [Stupka Tomáš](https://github.com/ondrasouk/Digital-electronics-1)
5. [Šomšák Martin ]()

[Link to GitHub project folder](https://github.com/ondrasouk/Digital-Electronics-1-project)

## Úvod

Úkolem tohoto projektu bylo vytvořit konzoli pro měření otáček rotopedu. Toto měření následně vede na rozšíření jako napříkad měření rychlosti, ujeté vzdálenosti, průměrné rychlosti atd. 

V našem případě jsme se rozhodli pro snímání otáček použít čidlo [KY-024](https://dratek.cz/arduino/7702-halluv-senzor-modul-ky-024.html?gclid=Cj0KCQjwyN-DBhCDARIsAFOELTkRZ7OF-TIUvYM4dajaB7tR17BqWOsx69k_GcUOzbV9BiPjra_8NO0aAtTbEALw_wcB), který obsahuje s halovu sondu. Výstupem čidla je buď logická 0 nebo 1. Pokud tento sensor umístíme na pevný bod v blízkoti otáčenícího kola, je nutné přidat na otáčejí se kole magnetický puk. Následně při otáčení kola snímač vygeneruje signál pomocí kterého můžeme určit požadované veličiny. 
Pro následní zobrazení měřené veličiny byl využit 4x7 segmentový displej a tři ledky pro indikaci zobrazovaného výstupu (zapnuto/vypnuto, přepínání zobrazení, reset systému).

## Popis zapojení 


## Programová část části

```vhdl
```

### Simulace 

TODO


## Video
*Přidat*
[Link na video prezentace]()


## Reference

   1. [https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board/](https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board/)
   2. [https://reference.digilentinc.com/reference/programmable-logic/arty-a7/reference-manual](https://reference.digilentinc.com/reference/programmable-logic/arty-a7/reference-manual)
   3. [arty_a7_sch.pdf](Docs/arty_a7_sch.pdf)
   4. [KY-024 datasheet](https://dratek.cz/docs/produkty/0/923/49e.pdf)
   
TODO
