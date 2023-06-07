"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
import os

POSTGRES_PASSWORD = os.getenv('POSTGRES_PASSWORD')  # Пароль через переменные среды
BASE_PATH = os.path.abspath("north_data")           # Абсолютная версия пути

# Подключение к БД Postgres
conn = psycopg2.connect(host="localhost", database="north", user="postgres", password=POSTGRES_PASSWORD)
try:
    with conn:
        with conn.cursor() as cur:

            # Занесение информации в таблицу "employees"
            with open(os.path.join(BASE_PATH, 'employees_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.reader(csv_file)
                next(reader)
                for item in reader:
                    cur.execute('INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)', item)

            # Занесение информации в таблицу "customers"
            with open(os.path.join(BASE_PATH, 'customers_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.reader(csv_file)
                next(reader)
                for item in reader:
                    cur.execute('INSERT INTO customers VALUES (%s, %s, %s)', item)

            # Занесение информации в таблицу "orders"
            with open(os.path.join(BASE_PATH, 'orders_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.reader(csv_file)
                next(reader)
                for item in reader:
                    cur.execute('INSERT INTO orders VALUES (%s, %s, %s, %s, %s)', item)

finally:
    conn.close()


