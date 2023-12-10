"""Скрипт для заполнения данными таблиц в БД Postgres."""

import psycopg2
import csv


def csv_file_reader(file_name: str) -> list:
    """
    Метод читает CSV-файл
    """
    with open(file_name) as data_file:
        out_list = []

        # Читаем данные из файла
        data = csv.DictReader(data_file)

        # Читаем имена столбцев таблицы
        data_field = data.fieldnames

        # Формируем выходной список для записи в базу данных
        for dt in data:
            temp_list_data = []
            for df in data_field:
                temp_list_data.append(dt[df])
            out_list.append(tuple(temp_list_data))
        return out_list


# Имена таблиц базы данных 'north'
database_table_names = ["customers", "employees", "orders"]

fl_name = ""
password = input('Введите password для подключения к базе данных\n-> ')

# Заполняем таблицы базы данных 'north'
conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password=password
)

with conn:
    for dat_tab_nam in database_table_names:
        fl_name = f"north_data/{dat_tab_nam}_data.csv"
        with conn.cursor() as cur:
            out_date = csv_file_reader(fl_name)
            out_str = f"INSERT INTO {dat_tab_nam} VALUES ({'%s, ' * (len(out_date[0]) - 1)}%s)"
            cur.executemany(out_str, out_date)
            cur.execute(f"SELECT * FROM {dat_tab_nam}")

conn.close()
