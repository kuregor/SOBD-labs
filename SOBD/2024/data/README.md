## Датасет US Accidents (2016 – 2023)

Источник: <https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents>, файл `US_Accidents_March23.csv`.

Сами данные в репозиторий не входят (исключены через `.git/info/exclude`), здесь лежат только локально.

| Каталог | Содержимое | Формат | Объём | Откуда берётся |
| --- | --- | --- | --- | --- |
| `original/` | `US_Accidents_March23.csv` — 7 728 394 записи, 46 признаков | `CSV` | 2,8 ГБ | архив с Kaggle (`US_Accidents_March23.csv.zip`, 650 МБ) распаковать сюда |

Файл загружается в `HDFS` (`/datasets/us_accidents/`) командой `hdfs dfs -put` — см. раздел «Запуск» в корневом README.
Дальше данные живут только в таблицах `Apache Iceberg` в `HDFS`:

| Таблица | Что внутри | Создаётся ноутбуком |
| --- | --- | --- |
| `sobd_accidents.us_accidents_raw` | исходные данные с именами в `snake_case` и правильными типами | `lab1/1_Data_loading.ipynb` |
| `sobd_accidents.us_accidents_clean` | очищенные данные: без дубликатов, ошибок и пропусков, с новыми признаками | `lab1/2_Exploratory_analysis.ipynb` |
