# L07 — Co se změní, když přidáme prediktor?

**Vícenásobný lineární model na klimatických datech křídlatky**

Tento repozitář obsahuje sedmou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Jak souvisí tloušťka listů křídlatky japonské s klimatem místa, odkud populace pochází, a co se stane s odhadem, když do modelu přidáme další prediktory? Sedmá lekce rozšiřuje jednoduchý lineární model na model s několika současně uvažovanými vysvětlujícími proměnnými.

Pracujeme s populacemi křídlatky z původního i zavlečeného areálu pěstovanými ve společné zahradě. Na klimatických proměnných ukážeme, že koeficient ve víceprediktorovém modelu popisuje vztah při stejných hodnotách ostatních prediktorů a že přidání související informace může změnit velikost, směr i nejistotu odhadu.

Lekce zdůrazňuje korelaci prediktorů, realistické kombinace hodnot při predikci a hranici mezi popsanou asociací a příčinným tvrzením. Otázka, zda se vztah liší mezi původními a zavlečenými populacemi, připravuje přechod k interakcím v další lekci.

## Výsledky učení

Po prostudování této lekce dokážete:

- zapsat a fitovat lineární model s několika prediktory;
- interpretovat koeficient jako vztah podmíněný stejnými hodnotami ostatních prediktorů;
- vysvětlit, proč se koeficient po přidání dalšího prediktoru může změnit;
- rozpoznat korelaci prediktorů a překrývající se informaci, která ztěžuje oddělení jejich příspěvků;
- použít `emmeans()` při zadané hodnotě numerického prediktoru;
- vytvářet predikce pouze pro úplné a společně realistické kombinace hodnot;
- odlišit asociaci klimatu původu s vlastnostmi rostlin od důkazu příčinného účinku.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L07. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L07/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L07/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L07/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L07/current/presentation/presentation.pdf) |
| Praktické cvičení v R | [Stáhnout skript](https://cuni-natur-biostatistics.github.io/L07/current/code/cviceni.R) | — |
| Data ke cvičení | [Populace křídlatky](https://cuni-natur-biostatistics.github.io/L07/current/data/kridlatka_populace.csv) | — |

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je schválený studentský skript k praktickému cvičení.
- `data/kridlatka_populace.csv` je připravený výukový dataset populací křídlatky z Dryad a CHELSA; zdroje, licence a kontrolní součet popisuje [datový README](data/README.md).
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L07.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L07-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L07/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
