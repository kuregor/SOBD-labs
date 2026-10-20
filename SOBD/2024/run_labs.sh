#!/usr/bin/env bash
# Очередь ноутбуков: выполняются строго по одному, следующий — после окончания предыдущего.
# При ошибке очередь останавливается, чтобы следующие ноутбуки не работали на неполных данных.
#
# Запуск в фоне (продолжит работать после закрытия VS Code или обрыва SSH):
#   nohup bash SOBD/2024/run_labs.sh > run_labs.log 2>&1 &
#   tail -f run_labs.log
set -uo pipefail

# Python окружения кафедры, а если его нет (локальный стенд) — системный python3
PY=/opt/conda-spark-envs/pyspark-env/bin/python
[ -x "$PY" ] || PY=python3

cd "$(dirname "$0")"

NOTEBOOKS=(
    lab1/1_Data_loading.ipynb
    lab1/2_Exploratory_analysis.ipynb
    lab2/1_Random_Forest_Regression.ipynb
    lab2/2_Logistic_Regression.ipynb
)

for nb in "${NOTEBOOKS[@]}"; do
    echo "$(date '+%H:%M:%S') старт  $nb"
    start=$SECONDS
    # запускаем из папки ноутбука: от неё ноутбук строит пути проекта
    if ! (cd "$(dirname "$nb")" && "$PY" -m jupyter nbconvert --to notebook --execute --inplace \
            --ExecutePreprocessor.timeout=-1 "$(basename "$nb")"); then
        echo "$(date '+%H:%M:%S') ОШИБКА в $nb — очередь остановлена"
        exit 1
    fi
    echo "$(date '+%H:%M:%S') готово $nb за $(( (SECONDS - start) / 60 )) мин"
done
echo "Все ноутбуки выполнены"
