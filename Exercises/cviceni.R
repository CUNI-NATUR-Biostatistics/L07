#----------------------------------------------------------#
#
#       L07 — Co se změní, když přidáme prediktor?
#       Více prediktorů a překrývající se informace
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava: projekt, skript a data -----
#----------------------------------------------------------#

# Projekt v RStudiu je hlavní složka pro jednu práci. Soubor
# .Rproj pomáhá tuto složku znovu otevřít. Skript a data jsou
# samostatné soubory uvnitř projektu. Uložení skriptu neuloží
# objekty v aktuální relaci R.
#
# V RStudiu zvolte File > New Project > New Directory >
# New Project. Jako Directory name zadejte L07_praktikum.
# V Create project as subdirectory of vyberte složku, kde
# chcete práci uchovat, a potvrďte Create Project.
# Název otevřeného projektu uvidíte vpravo nahoře.
#
# V panelu Files klikněte New Folder, pojmenujte ji data
# a otevřete ji. Stáhněte soubor:
# https://cuni-natur-biostatistics.github.io/L07/current/data/kridlatka_populace.csv
# Uložte jej jako kridlatka_populace.csv do složky data.
# Kliknutím na .. v panelu Files se vraťte do hlavní složky.
# Stáhněte skript:
# https://cuni-natur-biostatistics.github.io/L07/current/code/cviceni.R
# Uložte jej do hlavní složky projektu jako cviceni.R.
# V RStudiu zvolte File > Open File a stažený skript otevřete.
#
# L07_praktikum/
#   L07_praktikum.Rproj
#   cviceni.R
#   data/
#     kridlatka_populace.csv
#
# Skript spouštějte shora dolů. Jeden příkaz spusťte kurzorem
# na jeho řádku pomocí Ctrl + Enter. U víceřádkového příkazu
# označte všechny jeho řádky a stiskněte Ctrl + Enter.
# Výsledky se ukážou v Console, grafy v Plots. Řádky začínající
# znakem # jsou komentáře a R je nespouští.
# Pod „Vaše řešení“ pište příkazy bez #; slovní odpovědi pište
# na komentářové řádky začínající #. Kopii průběžně ukládejte
# pomocí Ctrl + S. Nápovědy čtěte postupně.
#
# Hlavní úlohy L07-U01 až L07-U08 tvoří společnou trasu.
# Pozdější úlohy používají data_kridlatka z U01 a modely
# vytvořené v U02, U03 a U05. Úlohy navíc jsou dobrovolné.
# Projekt znovu otevřete dvojklikem na soubor .Rproj.
# Restart R smaže objekty z aktuální relace, ale uložený
# skript a CSV zůstanou na disku. Po restartu spusťte svůj
# uložený skript znovu shora dolů.


#--------------------------------------------------#
## Výsledky učení a návaznost na L06 -----
#--------------------------------------------------#

# Po praktiku dokážete fitovat aditivní lineární model
# s více prediktory, vykládat jeho koeficienty při stejných
# hodnotách ostatních prediktorů, popsat změnu odhadu po
# přidání prediktoru a rozpoznat problém silně korelovaných
# prediktorů.
#
# V L06 jste pracovali s kategoriálním prediktorem, referenční
# skupinou, intervalem spolehlivosti a funkcí anova(). Pokud
# tyto pojmy znáte, následující připomenutí přeskočte:
# - intercept je odhad pro referenční skupinu při nulových
#   hodnotách číselných prediktorů;
# - skupinový koeficient je rozdíl vůči referenční skupině;
# - interval spolehlivosti vyjadřuje nejistotu odhadu;
# - test koeficientu se ptá na jeden koeficient při zohlednění
#   ostatních prediktorů v modelu;
# - residuum je pozorovaná hodnota minus odhad modelu.


#--------------------------------------------------#
## Kontrola souboru -----
#--------------------------------------------------#

# Cesta začíná v hlavní složce otevřeného projektu.
# Kontrola nic nestahuje ani nemění ve vašem počítači.
soubor_kridlatka <- "data/kridlatka_populace.csv"

if (
  !file.exists(soubor_kridlatka)) {
  stop(
    paste0(
      "Soubor data/kridlatka_populace.csv nebyl nalezen. ",
      "Otevřete projekt L07_praktikum a zkontrolujte název ",
      "i umístění CSV ve složce data."
    ),
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#


#--------------------------------------------------#
## Co představuje jeden řádek? -----
#--------------------------------------------------#

# Tabulka vychází z experimentu se zdrojovými populacemi
# křídlatky pěstovanými ve společné zahradě v Šanghaji.
# Jeden řádek je průměr za jednu zdrojovou populaci, nikoli
# jedna rostlina. Klimatické proměnné popisují místo původu.
# Hodnoty Puvodni a Zavleceny ponecháváme v kódu bez diakritiky,
# aby odpovídaly hodnotám uloženým v CSV.


#----------------------------------------#
### Úloha | L07-U01 -----
#----------------------------------------#

# Zadání: Načtěte soubor_kridlatka pomocí read.csv() do
# data_kridlatka. Zjistěte počet řádků a sloupců, zobrazte
# názvy proměnných a spočítejte chybějící hodnoty ve sloupcích
# tloustka_listu_mm, teplota_rocni_C, teplota_max_C a puvod.
# Převeďte puvod na faktor s úrovněmi nejprve "Puvodni"
# a potom "Zavleceny" a zobrazte jejich četnosti. Určete
# odezvu, možné prediktory a jednotku analýzy.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Tabulka má 128 řádků a 14 sloupců.
# V uvedených čtyřech sloupcích nic nechybí. Faktor má
# 55 původních a 73 zavlečených populací; referencí je
# Puvodni. Odezvou je populační průměr tloušťky listu v mm.
# Jeden řádek a jedna jednotka analýzy jsou jedna populace.
# Nápověda 1: Oddělte technickou kontrolu tabulky od otázky,
# co biologicky představuje jeden její řádek.
# Nápověda 2: Použijte nrow(), ncol(), names(), colSums()
# spolu s is.na(), factor() s argumentem levels a table().
# Interpretace: Proč by 128 řádků nebylo správné popsat jako
# 128 nezávislých jednotlivých rostlin?


#--------------------------------------------------#
## Celkový vztah k průměrné roční teplotě -----
#--------------------------------------------------#

# Nejprve položíme známou jednoprediktorovou otázku.
# Bodový graf ukáže jednotlivé populační průměry; model
# shrne jejich průměrný lineární vztah k roční teplotě.


#----------------------------------------#
### Úloha | L07-U02 -----
#----------------------------------------#

# Zadání: Z data_kridlatka nakreslete bodový graf tloušťky
# listu proti průměrné roční teplotě. Popište obě osy včetně
# jednotek. Fitujte mod_rocni_teplota s odezvou
# tloustka_listu_mm a prediktorem teplota_rocni_C.
# Přidejte do grafu přímku pomocí abline(), zobrazte summary(),
# confint(). Potom samostatně vykreslete fitted hodnoty
# proti residuím s českými popisky os v mm a vodorovnou čárou
# v nule. Vyložte sklon na 1 °C i na rozdíl 5 °C.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Sklon je přibližně −0,00913 mm/°C
# a jeho 95% interval je přibližně −0,01081 až −0,00746.
# Rozdíl 5 °C odpovídá odhadované změně asi −0,0457 mm.
# Graf klesá a rezidua neukazují výrazný oblouk nebo trychtýř.
# Nápověda 1: Nejprve zobrazte pozorování, potom fitujte model
# a stejný model použijte pro přímku i diagnostiku.
# Nápověda 2: Použijte plot(), lm(), abline(), summary(),
# confint(), fitted() a resid(); nulovou čáru přidejte
# pomocí abline() s argumenty h = 0 a lty = 2.
# Interpretace: Popisuje sklon příčinný účinek teploty,
# nebo celkovou asociaci mezi populacemi?


#--------------------------------------------------#
## Připomenutí: znaménko + skládá příspěvky -----
#--------------------------------------------------#

# Následující malá tabulka je uměle vytvořený příklad.
# Neobsahuje data křídlatky a nevytváří řešení dalších úloh.
data_priklad <-
  data.frame(
    rust_cm = c(16.5, 21.6, 19.3, 24.0, 21.9, 26.3),
    teplota_C = c(15, 15, 20, 20, 25, 25),
    svetlo_h = c(6, 10, 6, 10, 6, 10)
  )

# Model odhaduje příspěvek teploty při stejném světle
# a příspěvek světla při stejné teplotě.
mod_priklad <-
  lm(
    formula = rust_cm ~ teplota_C + svetlo_h,
    data = data_priklad
  )

coef(object = mod_priklad)


#--------------------------------------------------#
## Dvě teploty v jednom modelu -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha | L07-U03 -----
#----------------------------------------#

# Zadání: Z data_kridlatka fitujte mod_dve_teploty s formulí
# tloustka_listu_mm ~ teplota_rocni_C + teplota_max_C.
# Zobrazte summary() a confint(). Vyložte oba teplotní
# koeficienty v mm na 1 °C a vždy přesně uveďte, kterou
# druhou teplotu při porovnání držíme stejnou. Vysvětlete,
# co zde znamená + a proč tento model neobsahuje interakci.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Při stejném maximu je koeficient roční
# teploty asi −0,00528 mm/°C. Při stejné roční teplotě je
# koeficient maxima asi −0,00475 mm/°C. Znaménko + přidává
# oba příspěvky do jednoho aditivního modelu; nedovoluje,
# aby se sklon jednoho prediktoru měnil s druhým prediktorem.
# Nápověda 1: Každý koeficient odpovídá porovnání, ve kterém
# ostatní prediktor modelu zůstává stejný.
# Nápověda 2: V lm() uveďte oba názvy napravo od ~ oddělené
# znakem +; hodnoty čtěte v příslušných řádcích summary().
# Interpretace: Proč tyto dva koeficienty nejsou dvě původní
# jednoprediktorové přímky vložené vedle sebe?


#--------------------------------------------------#
## Korelované prediktory sdílejí informaci -----
#--------------------------------------------------#

# Korelace obou teplot popisuje, nakolik se mezi populacemi
# mění společně. Standardní chyba koeficientu ukazuje přesnost,
# s jakou model oddělil jeho vlastní příspěvek.


#----------------------------------------#
### Úloha | L07-U04 -----
#----------------------------------------#

# Zadání: Nakreslete bodový graf teplota_max_C proti
# teplota_rocni_C a vypočítejte jejich Pearsonovu korelaci.
# Z úplných tabulek coef(summary(mod_rocni_teplota)) a
# coef(summary(mod_dve_teploty)) přečtěte pro teplota_rocni_C
# odhad a standardní chybu. Porovnejte jejich velikost před
# a po přidání teplota_max_C a vysvětlete oba posuny.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Korelace je přibližně 0,855. Odhad
# roční teploty se změní z −0,00913 na −0,00528 mm/°C
# a standardní chyba vzroste přibližně z 0,00085 na 0,00159.
# Prediktory nesou překrývající se klimatickou informaci,
# takže jejich samostatné příspěvky se oddělují méně přesně.
# Nápověda 1: Spojte tvar mraku dvou teplot s tím, kolik
# nezávislé informace každá z nich přináší modelu.
# Nápověda 2: Použijte plot(), cor() a sloupce Estimate
# a Std. Error v obou úplných tabulkách koeficientů.
# Interpretace: Proč změna koeficientu sama neznamená,
# že jeden model je správný a druhý chybný?


#--------------------------------------------------#
## Teplota a původ populací -----
#--------------------------------------------------#

# Původní populace jsou referenční úrovní faktoru z U01.
# Aditivní model s původem a teplotou odhaduje dvě rovnoběžné
# přímky: společný sklon a stálý svislý rozdíl skupin.
# Následující pojmenované vektory dávají skupinám přístupné
# barvy, odlišné symboly bodů a odlišné typy čar.
barvy_puvodu <-
  c(
    Puvodni = "#B4461B",
    Zavleceny = "#007C91"
  )
symboly_puvodu <-
  c(
    Puvodni = 16,
    Zavleceny = 17
  )
typy_car_puvodu <-
  c(
    Puvodni = 1,
    Zavleceny = 2
  )


#----------------------------------------#
### Úloha | L07-U05 -----
#----------------------------------------#

# Zadání: Bodovým grafem zobrazte tloušťku proti roční
# teplotě a osy popište česky v °C a mm. Skupiny rozlište
# pomocí barvy_puvodu a symboly_puvodu a přidejte legendu.
# Fitujte mod_puvod
# s formulí tloustka_listu_mm ~ puvod + teplota_rocni_C.
# Zobrazte summary() a confint(). Do grafu přidejte dvě
# modelové přímky pomocí abline(): první používá intercept
# a společný sklon, druhá intercept plus puvodZavleceny
# a stejný sklon. Rozlište je pomocí barvy_puvodu
# a typy_car_puvodu; stejné znaky použijte také v legendě.
# Určete referenci a vyložte skupinový rozdíl i společný sklon.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Referencí jsou původní populace.
# Zavlečené populace mají při stejné roční teplotě odhad
# tloušťky vyšší asi o 0,10895 mm. Společný sklon je asi
# +0,00149 mm/°C a jeho 95% interval přibližně −0,00091
# až +0,00389. Graf ukazuje dvě rovnoběžné přímky se stejným
# sklonem a různou výškou; symboly a typy čar rozlišují skupiny
# i bez barevného zobrazení.
# Nápověda 1: Skupinový koeficient porovnává skupiny při
# stejné teplotě; teplotní koeficient porovnává teploty
# při stejném původu.
# Nápověda 2: V plot() indexujte col a pch faktorem puvod.
# Obě abline() mají stejný argument b; pro zavlečené populace
# přičtěte skupinový koeficient k argumentu a. Legendě předejte
# stejné barvy, symboly a typy čar.
# Interpretace: Jak se otázka společného sklonu liší od
# celkového sklonu napříč oběma skupinami v U02?


#--------------------------------------------------#
## Připomenutí: predikce potřebuje všechny prediktory -----
#--------------------------------------------------#

# Pro syntetický mod_priklad vytvoříme jeden nový řádek.
# Obsahuje oba prediktory se stejnými názvy a jednotkami.
data_priklad_predikce <-
  data.frame(
    teplota_C = 20,
    svetlo_h = 8
  )

predict(
  object = mod_priklad,
  newdata = data_priklad_predikce,
  interval = "confidence"
)


#--------------------------------------------------#
## Porovnání skupin při společné teplotě -----
#--------------------------------------------------#

# Smysluplný srovnávací bod musí ležet v rozsahu pozorovaném
# u původních i zavlečených populací. Dva nové řádky budou
# modelové scénáře, nikoli nově změřené populace.


#----------------------------------------#
### Úloha | L07-U06 -----
#----------------------------------------#

# Zadání: Vyberte v data_kridlatka roční teploty zvlášť
# pro obě úrovně puvod a funkcí range() zjistěte oba rozsahy.
# Určete jejich překryv. Vytvořte data_scenare se dvěma řádky:
# Puvodni a Zavleceny při teplota_rocni_C = 14. Sloupec puvod
# musí být faktor se stejnými úrovněmi jako v data_kridlatka.
# Pomocí predict() z mod_puvod vypočítejte bodové odhady
# a 95% intervaly spolehlivosti. Porovnejte rozdíl odhadů
# s koeficientem puvodZavleceny.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Rozsahy jsou 12,15–19,95 °C pro
# původní a 5,95–16,35 °C pro zavlečené populace; překryv
# je 12,15–16,35 °C. Při 14 °C jsou odhady asi 0,3323
# a 0,4412 mm. Rozdíl 0,10895 mm se rovná skupinovému
# koeficientu; oba intervaly popisují nejistotu průměru.
# Nápověda 1: Dolní mez překryvu je vyšší z obou dolních
# mezí a horní mez je nižší z obou horních mezí.
# Nápověda 2: Vytvořte data.frame() se sloupci puvod
# a teplota_rocni_C; v predict() nastavte newdata
# a interval = "confidence".
# Interpretace: Proč by teplota mimo společný rozsah byla
# slabším podkladem pro porovnání původu?


#--------------------------------------------------#
## Pořadí prediktorů a sekvenční test -----
#--------------------------------------------------#

# summary() testuje každý koeficient při zohlednění ostatních
# prediktorů. anova() jednoho modelu čte prediktory postupně
# zleva doprava: první dostane i jejich sdílenou informaci,
# druhý pouze informaci, kterou přidává po prvním.


#----------------------------------------#
### Úloha | L07-U07 -----
#----------------------------------------#

# Zadání: Fitujte mod_dve_teploty_opacne se stejnou odezvou
# a stejnými dvěma prediktory jako U03, ale napište nejprve
# teplota_max_C. Porovnejte pojmenované coef() obou modelů
# a největší absolutní rozdíl jejich fitted() hodnot.
# Potom zobrazte anova() pro oba modely a porovnejte součty
# čtverců, F a p-hodnoty obou teplot. Vysvětlete, co pořadí
# změnilo a co nezměnilo.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Odpovídající koeficienty a fitted
# hodnoty jsou stejné až na numerické zaokrouhlení. Když je
# roční teplota první, součty čtverců jsou asi 0,20170
# a 0,01327; při opačném pořadí asi 0,19679 a 0,01817.
# Sekvenční F a p se změní, fit modelu ani testy koeficientů ne.
# Nápověda 1: Před porovnáním koeficientů je seřaďte podle
# jejich názvů; pořadí řádků ve dvou výstupech není stejné.
# Nápověda 2: Použijte sort(coef()), fitted(), max(), abs()
# a dvě samostatná volání anova().
# Interpretace: Proč přehazování pořadí není způsob,
# jak hledat příznivější p-hodnotu?


#--------------------------------------------------#
## Klimatický příběh křídlatky -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha | L07-U08 -----
#----------------------------------------#

# Zadání: Znovu zobrazte koeficient roční teploty a jeho
# 95% interval z mod_rocni_teplota a mod_puvod. Pro mod_puvod
# nakreslete fitted hodnoty proti residuím, obě osy popište
# česky v mm a přidejte vodorovnou čáru v nule. Potom napište
# 4–6 vět pro biologa: položte otázku
# a určete jednotku analýzy; popište celkový a podmíněný
# teplotní vztah; vyložte rozdíl původu při stejné teplotě;
# zhodnoťte nejistotu a diagnostiku; uveďte alespoň dvě
# omezení a vyhněte se příčinnému tvrzení.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Celkový sklon je asi −0,00913 mm/°C,
# ale při stejném původu asi +0,00149 mm/°C a jeho interval
# obsahuje nulu. Zavlečené populace mají při stejné teplotě
# odhad asi o 0,10895 mm vyšší. Změna není rozpor: modely
# odpovídají na jinou otázku. Závěr se týká asociací mezi
# 128 zdrojovými populacemi, nikoli prokázaného účinku klimatu.
# Nápověda 1: Uspořádejte závěr od biologické otázky přes
# odhady a nejistotu k omezením zobecnění.
# Nápověda 2: Koeficienty vezměte z coef(), intervaly
# z confint(); na osy diagnostiky předejte fitted(mod_puvod)
# a resid(mod_puvod), potom použijte abline(h = 0, lty = 2).
# Interpretace: Který údaj ukazuje, že původ a roční teplota
# nesou v tomto souboru částečně propojenou informaci?


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Následující úlohy nejsou součástí povinné společné trasy.
# Vyberte si je pro další procvičení; nemusíte je dokončit
# během praktika.


#----------------------------------------#
### Úloha navíc | L07-N01 -----
#----------------------------------------#

# Zadání: Z data_kridlatka vyberte osm klimatických sloupců
# od teplota_rocni_C po srazky_sezonnost. Vypočítejte jejich
# korelační matici, zaokrouhlete ji na dvě desetinná místa
# a najděte jednu silnou kladnou a jednu zápornou dvojici.
# Vysvětlete, proč osm názvů neznamená osm nezávislých částí
# klimatické informace.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Matice je 8 × 8 a je souměrná.
# Roční a maximální teplota mají korelaci asi +0,85.
# Sezonnost teploty a minimum nejchladnějšího měsíce mají
# zápornou korelaci asi −0,64. Více dvojic tedy nese výrazně
# překrývající se klimatickou informaci.
# Nápověda 1: Nejprve vytvořte datový rámec obsahující pouze
# osm číselných klimatických proměnných.
# Nápověda 2: Sloupce vyberte vektorovým indexem a použijte
# cor() následované round() s digits = 2.
# Interpretace: Proč by model se všemi osmi prediktory nebyl
# automaticky nejlépe interpretovatelný?


#----------------------------------------#
### Úloha navíc | L07-N02 -----
#----------------------------------------#

# Zadání: Vytvořte data_klimaticke_scenare se dvěma řádky:
# podporovaný scénář teplota_rocni_C = 14 a teplota_max_C = 29
# a nepodporovaný scénář 7 a 33. Znovu nakreslete bodový graf
# teplota_max_C proti teplota_rocni_C z data_kridlatka,
# popište obě osy česky v °C a potom přidejte oba scénáře
# pomocí points(). Použijte mod_dve_teploty k predikci
# s intervaly spolehlivosti. Vysvětlete, proč samotný výstup
# predict() nevaruje před nepodporovanou kombinací.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: predict() vrátí čísla a intervaly
# pro oba řádky. První bod leží uvnitř pozorovaného mraku,
# zatímco kombinace 7 a 33 leží daleko od něj, i když obě
# jednotlivé hodnoty spadají do rozsahů svých proměnných.
# Nápověda 1: Podpora více prediktorů závisí na jejich
# společné kombinaci, ne jen na každém rozsahu samostatně.
# Nápověda 2: Nejprve zavolejte plot() s oběma sloupci
# data_kridlatka, teprve potom points() pro nové scénáře;
# predict() potřebuje oba sloupce v argumentu newdata.
# Interpretace: Co musíte před biologickým výkladem predikce
# zkontrolovat kromě jejího intervalu spolehlivosti?


#----------------------------------------#
### Úloha navíc | L07-N03 -----
#----------------------------------------#

# Zadání: Vypočítejte prostý průměr tloustka_listu_mm zvlášť
# pro obě úrovně puvod. Porovnejte jejich rozdíl s rozdílem
# dvou modelových odhadů při 14 °C z data_scenare v U06.
# Popište, co drží stejné modelové porovnání a co prosté
# skupinové průměry nezohledňují.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Prosté průměry jsou asi 0,3370
# a 0,4348 mm, rozdíl přibližně 0,0977 mm. Modelový rozdíl
# při stejné teplotě je asi 0,10895 mm. Odpovídají na dvě
# různé otázky, protože skupiny nemají stejné teplotní rozložení.
# Nápověda 1: Prostý průměr používá pozorované složení každé
# skupiny; modelové porovnání nastavuje stejnou teplotu.
# Nápověda 2: Vyberte hodnoty logickým indexem a použijte
# mean(). V obou porovnáních odečtěte hodnotu původních
# populací od hodnoty zavlečených populací.
# Interpretace: Které porovnání odpovídá koeficientu
# puvodZavleceny a proč?


#----------------------------------------#
### Úloha navíc | L07-N04 -----
#----------------------------------------#

# Zadání: Vytvořte data_jina_reference jako kopii
# data_kridlatka. Funkcí relevel() nastavte Zavleceny jako
# referenční úroveň puvod a fitujte mod_jina_reference se
# stejnou formulí jako mod_puvod. Porovnejte koeficienty
# a největší absolutní rozdíl fitted hodnot obou modelů.
# Co se změnilo a co zůstalo stejné?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Intercept a zápis skupinového rozdílu
# se změní; skupinový koeficient bude mít opačné znaménko.
# Společný sklon a fitted hodnoty zůstanou stejné až na
# numerické zaokrouhlení. Data ani fit modelu se nezměnily.
# Nápověda 1: Změna reference mění souřadnice popisu modelu,
# nikoli odhadnutou přímku pro každou populaci.
# Nápověda 2: V relevel() použijte ref = "Zavleceny";
# fitted hodnoty porovnejte pomocí max() a abs().
# Interpretace: Proč znaménko skupinového koeficientu nelze
# číst bez znalosti referenční skupiny?


#----------------------------------------#
### Úloha navíc | L07-N05 -----
#----------------------------------------#

# Zadání: Pro mod_puvod vypočítejte cooks.distance(), najděte
# index nejvyšší hodnoty a podle něj určete název populace
# v data_kridlatka. Nakreslete Cookovy vzdálenosti jako body.
# Navrhněte dva kroky, které byste provedli před rozhodnutím,
# zda s touto populací něco dělat. Populaci nemažte.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Najdete jednu populaci s nejvyšší
# Cookovou vzdáleností. Samotná vysoká hodnota nedokazuje
# chybu; je důvodem ověřit zdrojové údaje a zjistit, proč má
# pozorování vliv, nikoli důvodem k automatickému vyřazení.
# Nápověda 1: Hledejte pozorování, jehož vynechání by nejvíce
# změnilo odhady modelu, a oddělte vliv od datové chyby.
# Nápověda 2: Použijte cooks.distance(), which.max()
# a index řádku pro výběr sloupce populace.
# Interpretace: Jak by svévolné odstranění pozorování mohlo
# změnit vědeckou otázku nebo závěr?


#----------------------------------------#
### Úloha navíc | L07-N06 -----
#----------------------------------------#

# Zadání: Opravte každé tvrzení jednou až dvěma větami:
# A) „Více prediktorů vždy znamená lepší model.“
# B) „Když se koeficient po přidání prediktoru změnil,
# původní odhad byl chybný.“
# C) „Významný koeficient dokazuje, že prediktor změnu způsobil.“
# U každé opravy odkažte na konkrétní výsledek z hlavní trasy.
#
# Vaše odpověď:
#
#
# Očekávaný výsledek: A) Prediktory musí vycházet z biologické
# otázky a mohou přidávat překrývající se informaci. B) Modely
# mohou odpovídat na různé celkové a podmíněné otázky.
# C) Statistická asociace v observačních datech sama neprokazuje
# příčinu; společná zahrada neodstraňuje historii populací.
# Nápověda 1: Rozlište složitost modelu, formulaci otázky
# a sílu příčinného tvrzení.
# Nápověda 2: Pro A použijte U04, pro B U02 a U08 a pro C
# jednotku analýzy a omezení formulovaná v U08.
# Interpretace: Které z tvrzení by mohlo vést k nejzávažnějšímu
# biologickému omylu a proč?


#----------------------------------------------------------#
# Shrnutí a sebekontrola -----
#----------------------------------------------------------#

# Koeficient ve víceprediktorovém modelu popisuje změnu
# při stejných hodnotách ostatních prediktorů.
# Přidání prediktoru proto mění otázku, nejen číslo.
# Korelované prediktory sdílejí informaci a jejich samostatné
# příspěvky odhadujeme s menší přesností.
# Pořadí prediktorů mění sekvenční anova(), nikoli fit modelu.
# Interakce patří do L08; porovnání modelů pomocí R²,
# adjustovaného R² a AIC patří do L09.
#
# Odpovězte bez dalšího kódu:
# 1. Co znamená „při stejné hodnotě ostatních prediktorů“?
# 2. Proč se po přidání prediktoru může změnit koeficient?
# 3. Jak korelace prediktorů ovlivnila standardní chybu?
# 4. Co se změnilo po přehození pořadí prediktorů v anova()?
# 5. Proč samotný výpočet predict() nezaručuje oporu v datech?
