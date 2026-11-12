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
# Hlavní úlohy L07-U01 až L07-U08 řešte v uvedeném pořadí.
# Pozdější úlohy používají data_kridlatka z U01 a modely
# vytvořené v U02, U03 a U05. Úlohy navíc jsou dobrovolné.
# Projekt znovu otevřete dvojklikem na soubor .Rproj.
# Restart R smaže objekty z aktuální relace, ale uložený
# skript a CSV zůstanou na disku. Po restartu spusťte svůj
# uložený skript znovu shora dolů.


#--------------------------------------------------#
## Výsledky učení a návaznost na minulou lekci -----
#--------------------------------------------------#

# Po praktiku dokážete fitovat aditivní lineární model
# s více prediktory, vykládat jeho koeficienty při stejných
# hodnotách ostatních prediktorů, popsat změnu odhadu po
# přidání prediktoru a rozpoznat problém silně korelovaných
# prediktorů.
#
# V minulé lekci jste pracovali s kategoriálním prediktorem,
# referenční skupinou, intervalem spolehlivosti a funkcí
# anova(). Pokud tyto pojmy znáte, následující připomenutí
# přeskočte:
# - intercept modelu s kategoriálním prediktorem je odhadnutý
#   průměr referenční skupiny;
# - skupinový koeficient je rozdíl vůči referenční skupině;
# - interval spolehlivosti vyjadřuje nejistotu odhadu;
# - anova() modelu s kategoriálním prediktorem ukáže celkový
#   F-test: liší se průměry skupin více, než by odpovídalo
#   variabilitě uvnitř skupin?
# - residuum je pozorovaná hodnota minus odhadnutá hodnota;
#   residua kontrolujeme grafem proti odhadnutým hodnotám,
#   histogramem a Q–Q grafem (qqnorm() a qqline()).


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

# Zadání:
# Pracujte se souborem soubor_kridlatka.
# 1. Načtěte jej pomocí read.csv() do data_kridlatka.
# 2. Zjistěte počet řádků a sloupců a zobrazte názvy proměnných.
# 3. Spočítejte chybějící hodnoty ve sloupcích tloustka_listu_mm,
#    teplota_rocni_C, teplota_max_C a puvod.
# 4. Nakreslete histogram tloustka_listu_mm s českým popiskem osy x
#    včetně jednotky mm.
# 5. Převeďte puvod na faktor s úrovněmi nejprve "Puvodni" a potom
#    "Zavleceny" a zobrazte četnosti obou úrovní.
# 6. Určete odezvu, možné prediktory a jednotku analýzy.

# Vaše řešení:


# Nápověda 1:
# Oddělte technickou kontrolu tabulky od otázky, co biologicky představuje
# jeden její řádek. Rozdělení odezvy si prohlédněte dřív, než ji začnete
# shrnovat modelem.
#
# Nápověda 2:
# Použijte nrow(), ncol(), names(), colSums() spolu s is.na(), hist()
# s argumenty x, xlab a main, factor() s argumentem levels a table().
#
# Očekávaný výsledek:
# Tabulka má 128 řádků a 14 sloupců. V uvedených čtyřech sloupcích nic
# nechybí. Tloušťka listu leží asi mezi 0,29 a 0,52 mm a histogram má dva
# vrcholy, kolem 0,30–0,35 mm a kolem 0,40–0,45 mm. Faktor má 55 původních
# a 73 zavlečených populací; referenční skupinou je Puvodni. Odezvou je
# populační průměr tloušťky listu v mm. Jeden řádek a jedna jednotka
# analýzy jsou jedna populace.
#
# Interpretace:
# Proč by 128 řádků nebylo správné popsat jako 128 nezávislých jednotlivých
# rostlin? Co mohou naznačovat dva vrcholy histogramu?


#--------------------------------------------------#
## Celkový vztah k průměrné roční teplotě -----
#--------------------------------------------------#

# Nejprve položíme známou otázku s jedním prediktorem.
# Bodový graf ukáže jednotlivé populační průměry; model
# shrne jejich průměrný lineární vztah k roční teplotě.


#----------------------------------------#
### Úloha | L07-U02 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_kridlatka.
# 1. Nakreslete bodový graf tloušťky listu proti průměrné roční teplotě
#    a popište obě osy včetně jednotek.
# 2. Fitujte mod_rocni_teplota s odezvou tloustka_listu_mm a prediktorem
#    teplota_rocni_C.
# 3. Přidejte do grafu odhadnutou přímku pomocí abline().
# 4. Zobrazte summary() a confint().
# 5. V samostatném grafu vykreslete residua proti odhadnutým hodnotám
#    (fitted()) s českými popisky os v mm a vodorovnou čárou v nule.
# 6. Vyložte sklon na 1 °C i na rozdíl 5 °C.

# Vaše řešení:


# Nápověda 1:
# Nejprve zobrazte pozorování, potom fitujte model a stejný model použijte
# pro přímku i diagnostiku.
#
# Nápověda 2:
# Použijte plot(), lm(), abline(), summary(), confint(), fitted() a resid();
# nulovou čáru přidejte pomocí abline() s argumenty h = 0 a lty = 2.
#
# Očekávaný výsledek:
# Sklon je přibližně −0,00913 mm/°C a jeho 95% interval je přibližně
# −0,01081 až −0,00746. Rozdíl 5 °C odpovídá odhadované změně asi −0,0457
# mm. Graf klesá a residua neukazují výrazný oblouk nebo vějíř.
#
# Interpretace:
# Popisuje sklon příčinný účinek teploty, nebo celkovou asociaci mezi
# populacemi?


#--------------------------------------------------#
## Ukázka: znaménko + skládá příspěvky -----
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

# Výstup má tři čísla: intercept a po jednom koeficientu
# pro každý prediktor. Koeficient teplota_C je změna růstu
# na 1 °C při stejné délce světla.
coef(object = mod_priklad)


#--------------------------------------------------#
## Dvě teploty v jednom modelu -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha | L07-U03 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_kridlatka.
# 1. Fitujte mod_dve_teploty s formulí
#    tloustka_listu_mm ~ teplota_rocni_C + teplota_max_C.
# 2. Zobrazte summary() a confint().
# 3. Vyložte oba teplotní koeficienty v mm na 1 °C a vždy přesně uveďte,
#    kterou druhou teplotu při porovnání držíme stejnou.
# 4. Vysvětlete, co zde znamená + a proč tento model neobsahuje interakci.

# Vaše řešení:


# Nápověda 1:
# Každý koeficient odpovídá porovnání, ve kterém ostatní prediktor modelu
# zůstává stejný.
#
# Nápověda 2:
# V lm() uveďte oba názvy napravo od ~ oddělené znakem +; hodnoty čtěte v
# příslušných řádcích summary().
#
# Očekávaný výsledek:
# Při stejném maximu je koeficient roční teploty asi −0,00528 mm/°C. Při
# stejné roční teplotě je koeficient maxima asi −0,00475 mm/°C. Znaménko +
# přidává oba příspěvky do jednoho aditivního modelu; nedovoluje, aby se
# sklon jednoho prediktoru měnil s druhým prediktorem.
#
# Interpretace:
# Proč tyto dva koeficienty nejsou sklony dvou původních přímek s jedním
# prediktorem vložené vedle sebe?


#--------------------------------------------------#
## Korelované prediktory sdílejí informaci -----
#--------------------------------------------------#

# Korelace obou teplot popisuje, nakolik se mezi populacemi
# mění společně. Standardní chyba koeficientu ukazuje přesnost,
# s jakou model oddělil jeho vlastní příspěvek.


#----------------------------------------#
### Úloha | L07-U04 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_kridlatka, mod_rocni_teplota a mod_dve_teploty.
# 1. Nakreslete bodový graf teplota_max_C proti teplota_rocni_C
#    a vypočítejte jejich Pearsonovu korelaci.
# 2. Z úplných tabulek coef(summary(mod_rocni_teplota)) a
#    coef(summary(mod_dve_teploty)) přečtěte pro teplota_rocni_C odhad
#    a standardní chybu.
# 3. Porovnejte jejich velikost před a po přidání teplota_max_C
#    a vysvětlete oba posuny.

# Vaše řešení:


# Nápověda 1:
# Spojte tvar oblaku bodů dvou teplot s tím, kolik nezávislé informace
# každá z nich přináší modelu.
#
# Nápověda 2:
# Použijte plot(), cor() a sloupce Estimate a Std. Error v obou úplných
# tabulkách koeficientů.
#
# Očekávaný výsledek:
# Korelace je přibližně 0,855. Odhad roční teploty se změní z −0,00913 na
# −0,00528 mm/°C a standardní chyba vzroste přibližně z 0,00085 na 0,00159.
# Prediktory nesou překrývající se klimatickou informaci, takže jejich
# samostatné příspěvky se oddělují méně přesně.
#
# Interpretace:
# Proč změna koeficientu sama neznamená, že jeden model je správný a druhý
# chybný?


#--------------------------------------------------#
## Ukázka: barvy skupin, přímka a legenda -----
#--------------------------------------------------#

# Barvy podle skupiny, abline() a legend() jste už použili
# v dřívějším praktiku. Krátká ukázka na umělých datech:
# pojmenovaný vektor barev indexovaný faktorem dá každému bodu
# barvu jeho skupiny. abline(a = , b = ) nakreslí přímku
# z interceptu a a sklonu b.
delka_dne_priklad <-
  factor(
    x = c("kratky", "dlouhy", "kratky", "dlouhy", "kratky", "dlouhy"),
    levels = c("kratky", "dlouhy")
  )
barvy_priklad <-
  c(
    kratky = "#4E9A8A",
    dlouhy = "#C2613A"
  )

plot(
  x = data_priklad$teplota_C,
  y = data_priklad$rust_cm,
  col = barvy_priklad[delka_dne_priklad],
  pch = 16,
  xlab = "Teplota (°C)",
  ylab = "Růst (cm)"
)

# Přímka pro krátký den (6 h): intercept + 6 × koeficient světla
abline(
  a = coef(object = mod_priklad)[["(Intercept)"]] +
    6 * coef(object = mod_priklad)[["svetlo_h"]],
  b = coef(object = mod_priklad)[["teplota_C"]],
  col = barvy_priklad[["kratky"]]
)

legend(
  x = "topleft",
  legend = c("krátký den", "dlouhý den"),
  col = barvy_priklad,
  pch = 16
)


#--------------------------------------------------#
## Teplota a původ populací -----
#--------------------------------------------------#

# Původní populace jsou referenční skupinou faktoru z U01.
# Aditivní model s původem a teplotou odhaduje dvě rovnoběžné
# přímky: společný sklon a stálý svislý rozdíl skupin.
# Následující pojmenované vektory dávají skupinám přístupné
# barvy, odlišné symboly bodů a odlišné typy čar. Barvy jsou
# stejné jako ve skriptech a v přednášce.
barvy_puvodu <-
  c(
    Puvodni = "#4E9A8A",
    Zavleceny = "#C2613A"
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

# Zadání:
# Pracujte s data_kridlatka a s vektory barvy_puvodu, symboly_puvodu
# a typy_car_puvodu. Vektory indexujte faktorem data_kridlatka$puvod,
# stejně jako v ukázce výše.
# 1. Bodovým grafem zobrazte tloušťku proti roční teplotě, osy popište
#    česky v °C a mm a skupiny rozlište barvou a symbolem.
# 2. Fitujte mod_puvod s formulí
#    tloustka_listu_mm ~ puvod + teplota_rocni_C
#    a zobrazte summary() a confint().
# 3. Pomocí abline() přidejte dvě odhadnuté přímky: první používá
#    intercept a společný sklon, druhá intercept plus puvodZavleceny
#    a stejný sklon. Rozlište je barvou a typem čáry.
# 4. Přidejte legendu se stejnými barvami, symboly a typy čar.
# 5. Určete referenční skupinu a vyložte skupinový rozdíl i společný sklon.

# Vaše řešení:


# Nápověda 1:
# Skupinový koeficient porovnává skupiny při stejné teplotě; teplotní
# koeficient porovnává teploty při stejném původu.
#
# Nápověda 2:
# V plot() nastavte col = barvy_puvodu[data_kridlatka$puvod] a stejně pch.
# Obě abline() mají stejný argument b; pro zavlečené populace přičtěte
# skupinový koeficient k argumentu a. legend() potřebuje argumenty x,
# legend, col, pch a lty.
#
# Očekávaný výsledek:
# Referenční skupinou jsou původní populace. Zavlečené populace mají při
# stejné roční teplotě odhad tloušťky vyšší asi o 0,10895 mm. Společný
# sklon je asi +0,00149 mm/°C a jeho 95% interval přibližně −0,00091 až
# +0,00389. Graf ukazuje dvě rovnoběžné přímky se stejným sklonem a různou
# výškou; symboly a typy čar rozlišují skupiny i bez barevného zobrazení.
#
# Interpretace:
# Jak se otázka společného sklonu liší od celkového sklonu napříč oběma
# skupinami v U02?


#--------------------------------------------------#
## Ukázka: predikce potřebuje všechny prediktory -----
#--------------------------------------------------#

# Pro syntetický mod_priklad vytvoříme jeden nový řádek.
# Obsahuje oba prediktory se stejnými názvy a jednotkami.
data_priklad_predikce <-
  data.frame(
    teplota_C = 20,
    svetlo_h = 8
  )

# Výstup má sloupce fit, lwr a upr: predikci průměrného růstu
# a dolní a horní hranici jejího 95% intervalu spolehlivosti.
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

# Zadání:
# Pracujte s data_kridlatka a mod_puvod.
# 1. Funkcí range() zjistěte rozsah teplota_rocni_C zvlášť pro obě úrovně
#    puvod a určete překryv obou rozsahů.
# 2. Vytvořte data_scenare se dvěma řádky: Puvodni a Zavleceny při
#    teplota_rocni_C = 14. Sloupec puvod musí být faktor se stejnými
#    úrovněmi jako v data_kridlatka.
# 3. Pomocí predict() z mod_puvod vypočítejte predikce a jejich 95%
#    intervaly spolehlivosti.
# 4. Porovnejte rozdíl obou predikcí s koeficientem puvodZavleceny.

# Vaše řešení:


# Nápověda 1:
# Dolní hranice překryvu je vyšší z obou dolních hranic a horní hranice
# je nižší z obou horních hranic.
#
# Nápověda 2:
# Vytvořte data.frame() se sloupci puvod a teplota_rocni_C; v predict()
# nastavte newdata a interval = "confidence".
#
# Očekávaný výsledek:
# Rozsahy jsou 12,15–19,95 °C pro původní a 5,95–16,35 °C pro zavlečené
# populace; překryv je 12,15–16,35 °C. Při 14 °C jsou predikce asi 0,3323
# a 0,4412 mm. Rozdíl 0,10895 mm se rovná skupinovému koeficientu; oba
# intervaly popisují nejistotu průměru.
#
# Interpretace:
# Proč by teplota mimo společný rozsah byla slabším podkladem pro porovnání
# původu?


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

# Zadání:
# Pracujte s data_kridlatka a mod_dve_teploty z U03.
# 1. Fitujte mod_dve_teploty_opacne se stejnou odezvou a stejnými dvěma
#    prediktory, ale napište nejprve teplota_max_C.
# 2. Porovnejte pojmenované coef() obou modelů a největší absolutní rozdíl
#    jejich odhadnutých hodnot (fitted()).
# 3. Zobrazte anova() pro oba modely a porovnejte součty čtverců, F
#    a p-hodnoty obou teplot.
# 4. Vysvětlete, co pořadí změnilo a co nezměnilo.

# Vaše řešení:


# Nápověda 1:
# Před porovnáním koeficientů je seřaďte podle jejich názvů; pořadí řádků ve
# dvou výstupech není stejné.
#
# Nápověda 2:
# Použijte sort(coef()), fitted(), max(), abs() a dvě samostatná volání
# anova().
#
# Očekávaný výsledek:
# Odpovídající koeficienty a odhadnuté hodnoty jsou stejné až na numerické
# zaokrouhlení. Když je roční teplota první, součty čtverců jsou asi 0,20170
# a 0,01327; při opačném pořadí asi 0,19679 a 0,01817. Sekvenční F a p se
# změní, fit modelu ani testy koeficientů ne.
#
# Interpretace:
# Proč přehazování pořadí není způsob, jak hledat příznivější p-hodnotu?


#--------------------------------------------------#
## Klimatický příběh křídlatky -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha | L07-U08 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_rocni_teplota z U02 a mod_puvod z U05.
# 1. Znovu zobrazte koeficient roční teploty a jeho 95% interval z obou
#    modelů.
# 2. Pro mod_puvod nakreslete residua proti odhadnutým hodnotám, obě osy
#    popište česky v mm a přidejte vodorovnou čáru v nule.
# 3. Pro mod_puvod nakreslete histogram residuí s českým popiskem osy x
#    a Q–Q graf residuí s referenční přímkou.
# 4. Napište 4–6 vět pro biologa:
#    a) položte otázku a určete jednotku analýzy;
#    b) popište celkový a podmíněný teplotní vztah;
#    c) vyložte rozdíl původu při stejné teplotě;
#    d) zhodnoťte nejistotu a kontrolu residuí;
#    e) uveďte alespoň dvě omezení a vyhněte se příčinnému tvrzení.

# Vaše řešení:


# Nápověda 1:
# Uspořádejte závěr od biologické otázky přes odhady a nejistotu k omezením
# zobecnění. Tři grafy residuí čtěte společně: tvar kolem nuly, rozdělení
# a chvosty.
#
# Nápověda 2:
# Koeficienty vezměte z coef(), intervaly z confint(); na osy prvního grafu
# předejte fitted(mod_puvod) a resid(mod_puvod), potom použijte
# abline(h = 0, lty = 2). Histogram nakreslete pomocí hist() a Q–Q graf
# pomocí qqnorm() a qqline() se stejnými residui.
#
# Očekávaný výsledek:
# Celkový sklon je asi −0,00913 mm/°C, ale při stejném původu asi +0,00149
# mm/°C a jeho interval obsahuje nulu. Zavlečené populace mají při stejné
# teplotě odhad asi o 0,10895 mm vyšší. Změna není rozpor: modely odpovídají
# na jinou otázku. Histogram residuí je soustředěný kolem nuly a většina
# residuí leží mezi −0,04 a +0,04 mm; několik populací má residua až asi
# −0,09 a +0,11 mm. V Q–Q grafu leží body uprostřed blízko přímky a na obou
# koncích se od ní odklánějí, výrazněji v horním konci: chvosty
# rozdělení residuí jsou těžší, než by odpovídalo normálnímu rozdělení. Závěr se týká asociací mezi 128
# zdrojovými populacemi, nikoli prokázaného účinku klimatu.
#
# Interpretace:
# Který údaj ukazuje, že původ a roční teplota nesou v tomto souboru
# částečně propojenou informaci? Mění těžší chvosty residuí, jak opatrně
# formulujete závěr?


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Následující úlohy nejsou součástí hlavních úloh.
# Vyberte si je pro další procvičení; nemusíte je dokončit
# během praktika.


#----------------------------------------#
### Úloha navíc | L07-N01 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_kridlatka.
# 1. Vyberte osm klimatických sloupců od teplota_rocni_C po
#    srazky_sezonnost.
# 2. Vypočítejte jejich korelační matici a zaokrouhlete ji na dvě desetinná
#    místa.
# 3. Najděte jednu silnou kladnou a jednu zápornou dvojici.
# 4. Vysvětlete, proč osm názvů neznamená osm nezávislých částí klimatické
#    informace.

# Vaše řešení:


# Nápověda 1:
# Nejprve vytvořte datový rámec obsahující pouze osm numerických klimatických
# proměnných.
#
# Nápověda 2:
# Sloupce vyberte vektorovým indexem a použijte cor() následované round() s
# digits = 2.
#
# Očekávaný výsledek:
# Matice je 8 × 8 a je souměrná. Roční a maximální teplota mají korelaci
# asi +0,85. Sezonnost teploty a minimum nejchladnějšího měsíce mají zápornou
# korelaci asi −0,64. Více dvojic tedy nese výrazně překrývající se
# klimatickou informaci.
#
# Interpretace:
# Proč by model se všemi osmi prediktory nebyl automaticky nejlépe
# interpretovatelný?


#----------------------------------------#
### Úloha navíc | L07-N02 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_kridlatka a mod_dve_teploty.
# 1. Vytvořte data_klimaticke_scenare se dvěma řádky: podporovaný scénář
#    teplota_rocni_C = 14 a teplota_max_C = 29 a nepodporovaný scénář
#    7 a 33.
# 2. Znovu nakreslete bodový graf teplota_max_C proti teplota_rocni_C,
#    popište obě osy česky v °C a potom přidejte oba scénáře pomocí
#    points().
# 3. Použijte mod_dve_teploty k predikci s intervaly spolehlivosti.
# 4. Vysvětlete, proč samotný výstup predict() nevaruje před
#    nepodporovanou kombinací.

# Vaše řešení:


# Nápověda 1:
# Podpora více prediktorů závisí na jejich společné kombinaci, ne jen na
# každém rozsahu samostatně.
#
# Nápověda 2:
# Nejprve zavolejte plot() s oběma sloupci data_kridlatka, teprve potom
# points() pro nové scénáře; predict() potřebuje oba sloupce v argumentu
# newdata.
#
# Očekávaný výsledek:
# predict() vrátí čísla a intervaly pro oba řádky. První bod leží uvnitř
# pozorovaného oblaku bodů, zatímco kombinace 7 a 33 leží daleko od něj,
# i když obě jednotlivé hodnoty spadají do rozsahů svých proměnných.
#
# Interpretace:
# Co musíte před biologickým výkladem predikce zkontrolovat kromě jejího
# intervalu spolehlivosti?


#----------------------------------------#
### Úloha navíc | L07-N03 -----
#----------------------------------------#

# Zadání:
# Vypočítejte prostý průměr tloustka_listu_mm zvlášť pro obě úrovně puvod.
# Porovnejte jejich rozdíl s rozdílem dvou modelových odhadů při 14 °C z
# data_scenare v U06. Popište, co drží stejné modelové porovnání a co prosté
# skupinové průměry nezohledňují.

# Vaše řešení:


# Nápověda 1:
# Prostý průměr používá pozorované složení každé skupiny; modelové porovnání
# nastavuje stejnou teplotu.
#
# Nápověda 2:
# Vyberte hodnoty logickým indexem a použijte mean(). V obou porovnáních
# odečtěte hodnotu původních populací od hodnoty zavlečených populací.
#
# Očekávaný výsledek:
# Prosté průměry jsou asi 0,3370 a 0,4348 mm, rozdíl přibližně 0,0977 mm.
# Modelový rozdíl při stejné teplotě je asi 0,10895 mm. Odpovídají na dvě
# různé otázky, protože skupiny nemají stejné rozdělení teplot.
#
# Interpretace:
# Které porovnání odpovídá koeficientu puvodZavleceny a proč?


#----------------------------------------#
### Úloha navíc | L07-N04 -----
#----------------------------------------#

# Zadání:
# Vytvořte data_jina_reference jako kopii data_kridlatka. Funkcí relevel()
# nastavte Zavleceny jako referenční skupinu puvod a fitujte
# mod_jina_reference se stejnou formulí jako mod_puvod. Porovnejte
# koeficienty a největší absolutní rozdíl odhadnutých hodnot obou modelů.
# Co se změnilo a co zůstalo stejné?

# Vaše řešení:


# Nápověda 1:
# Změna referenční skupiny mění souřadnice popisu modelu, nikoli
# odhadnutou přímku pro každou populaci.
#
# Nápověda 2:
# V relevel() použijte ref = "Zavleceny"; odhadnuté hodnoty (fitted())
# porovnejte pomocí max() a abs().
#
# Očekávaný výsledek:
# Intercept a zápis skupinového rozdílu se změní; skupinový koeficient bude
# mít opačné znaménko. Společný sklon a odhadnuté hodnoty zůstanou stejné až na
# numerické zaokrouhlení. Data ani fit modelu se nezměnily.
#
# Interpretace:
# Proč znaménko skupinového koeficientu nelze číst bez znalosti referenční
# skupiny?


#----------------------------------------#
### Úloha navíc | L07-N05 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_puvod a data_kridlatka.
# 1. Vypočítejte cooks.distance() a nakreslete Cookovy vzdálenosti jako
#    body.
# 2. Přidejte vodorovnou čáru v hodnotě 4/n, kde n je počet populací,
#    a spočítejte, kolik populací tuto hranici překračuje.
# 3. Najděte index nejvyšší hodnoty a podle něj určete název populace
#    v data_kridlatka.
# 4. Fitujte stejný model bez této jedné populace a porovnejte sklon
#    teploty s modelem mod_puvod. Původní data neměňte.
# 5. Navrhněte dva kroky, které byste provedli před rozhodnutím, zda
#    s touto populací něco dělat. Populaci nemažte.

# Vaše řešení:


# Nápověda 1:
# Hledejte pozorování, jehož vynechání by nejvíce změnilo odhady modelu, a
# oddělte vliv od datové chyby.
#
# Nápověda 2:
# Použijte cooks.distance(), abline() s argumentem
# h = 4 / nrow(data_kridlatka), sum() s porovnáním > a which.max();
# index řádku použijte pro výběr ze sloupce populace. Pro model bez
# populace použijte v lm() argument data = data_kridlatka[-index, ].
#
# Očekávaný výsledek:
# Hranice 4/n je asi 0,031 a překračuje ji 11 ze 128 populací. Nejvyšší
# Cookovu vzdálenost (asi 0,087) má populace JA2. Bez ní je sklon teploty
# asi +0,0017 mm/°C místo +0,0015 mm/°C a jeho interval stále obsahuje
# nulu. Stejně opakovaně bez každé jednotlivé populace zůstává sklon asi
# mezi +0,0012 a +0,0018 mm/°C, takže žádná jednotlivá populace závěr
# neurčuje.
# Samotná vysoká hodnota nedokazuje chybu; je důvodem ověřit zdrojové údaje
# a zjistit, proč má pozorování vliv, nikoli důvodem k automatickému
# vyřazení.
#
# Interpretace:
# Jak by svévolné odstranění pozorování mohlo změnit vědeckou otázku nebo
# závěr?


#----------------------------------------#
### Úloha navíc | L07-N06 -----
#----------------------------------------#

# Zadání:
# Opravte každé tvrzení jednou až dvěma větami:
#
# A) „Více prediktorů vždy znamená lepší model.“
# B) „Když se koeficient po přidání prediktoru změnil, původní odhad byl
#    chybný.“
# C) „Statisticky významný koeficient dokazuje, že prediktor změnu
#    způsobil.“
#
# U každé opravy odkažte na konkrétní výsledek z hlavních úloh.

# Vaše řešení:


# Nápověda 1:
# Rozlište složitost modelu, formulaci otázky a sílu příčinného tvrzení.
#
# Nápověda 2:
# Pro A použijte U04, pro B U02 a U08 a pro C jednotku analýzy a omezení
# formulovaná v U08.
#
# Očekávaný výsledek:
# A) Prediktory musí vycházet z biologické otázky a mohou přidávat
# překrývající se informaci. B) Modely mohou odpovídat na různé celkové a
# podmíněné otázky. C) Statistická asociace v observačních datech sama
# neprokazuje příčinu; společná zahrada neodstraňuje historii populací.
#
# Interpretace:
# Které z tvrzení by mohlo vést k nejzávažnějšímu biologickému omylu a proč?


#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#

# Koeficient v modelu s více prediktory popisuje změnu
# při stejných hodnotách ostatních prediktorů.
# Přidání prediktoru proto mění otázku, nejen číslo.
# Korelované prediktory sdílejí informaci a jejich samostatné
# příspěvky odhadujeme s menší přesností.
# Pořadí prediktorů mění sekvenční anova(), nikoli fit modelu.
# Interakce prediktorů patří do následující lekce; porovnání
# modelů pomocí R², adjustovaného R² a AIC patří do pozdější
# lekce.
#
# Odpovězte bez dalšího kódu:
# 1. Co znamená „při stejné hodnotě ostatních prediktorů“?
# 2. Proč se po přidání prediktoru může změnit koeficient?
# 3. Jak korelace prediktorů ovlivnila standardní chybu?
# 4. Co se změnilo po přehození pořadí prediktorů v anova()?
# 5. Proč samotný výpočet predict() nezaručuje oporu v datech?
# 6. Které tři grafy residuí jste použili a co každý z nich ukazuje?
