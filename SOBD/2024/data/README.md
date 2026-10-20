## Датасет US Accidents (2016 – 2023)

Источник: <https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents>, файл `US_Accidents_March23.csv`
(7 728 394 записи, 46 признаков, 2,8 ГБ; архив на Kaggle — 650 МБ).

Файл кладётся в эту папку: `SOBD/2024/data/US_Accidents_March23.csv`. В репозиторий он не входит.

Дальше всё делают ноутбуки. Первый из них копирует файл в `HDFS`, и с этого момента данные живут
в папке проекта `/user/<логин>/SOBD-labs/` домашнего каталога `HDFS`:

| Путь в `HDFS` | Что внутри | Создаётся ноутбуком |
| --- | --- | --- |
| `SOBD-labs/data/US_Accidents_March23.csv` | исходный CSV | `lab1/1_Data_loading.ipynb` |
| `SOBD-labs/warehouse/sobd_accidents/us_accidents_raw` | таблица `Iceberg`: имена в `snake_case`, правильные типы | `lab1/1_Data_loading.ipynb` |
| `SOBD-labs/warehouse/sobd_accidents/us_accidents_clean` | таблица `Iceberg`: очищенные данные с новыми признаками | `lab1/2_Exploratory_analysis.ipynb` |
| `SOBD-labs/models/severity-logreg` | конвейер логистической регрессии с порогом | `lab2/2_Logistic_Regression.ipynb` |
