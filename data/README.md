# Výuková data L07

Soubor `kridlatka_populace.csv` obsahuje 128 zdrojových populací křídlatky ze šanghajské společné zahrady. Jeden řádek představuje jednu populaci.

Prvních šest sloupců (`populace`, `oblast`, `puvod`, souřadnice a `tloustka_listu_mm`) pochází ze schválené výukové tabulky L07, původně připravené z dat Cao et al. (2025), [Dryad DOI 10.5061/dryad.qbzkh18r4](https://doi.org/10.5061/dryad.qbzkh18r4), CC0. Osm klimatických sloupců bylo nově vyzvednuto podle souřadnic populací z [CHELSA-BIOCLIM 2.1](https://www.chelsa-climate.org/datasets/chelsa_bioclim), období 1981–2010, CC0. Použité vrstvy jsou bio1, bio4, bio5, bio6, bio12, bio13, bio14 a bio15. Citace klimatu: Brun et al. (2022), [EnviDat DOI 10.16904/envidat.332](https://doi.org/10.16904/envidat.332).

Volitelný postup pro přípravu tabulky je uveden ve skriptech v bloku „Doplňující: stažení a příprava dat“. Stávající sloupce znaků a souřadnic zůstaly při změně klimatického zdroje shodné. Klimatické hodnoty byly vyzvednuty funkcí `terra::extract()` z osmi vzdálených rastrů CHELSA ve WGS 84 (30 úhlových sekund). Soubor má 128 řádků bez chybějících hodnot; korelace bio1 a bio5 je 0,8545793.

SHA-256 souboru `kridlatka_populace.csv`: `638aa8dbf0829d27760e0447eebc7104c6c2270836935dafd8fa88f8b6dc4cc1`.

Původní data Dryad a klimatické vrstvy CHELSA mají vlastní podmínky CC0; nevztahuje se na ně licence původního výukového textu v kořenovém `LICENSE.md`.
