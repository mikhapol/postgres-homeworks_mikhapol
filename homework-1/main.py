"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
import os

POSTGRES_API_KEY = os.getenv('POSTGRES_API_KEY')
BASE_PATH = os.path.abspath("north_data")


conn = psycopg2.connect(host="localhost", database="north", user="postgres", password=POSTGRES_API_KEY)
try:
    with conn:
        with conn.cursor() as cur:

            # Занесение информации в таблицу "employees"
            with open(os.path.join(BASE_PATH, 'employees_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.DictReader(csv_file)
                for item in reader:
                    cur.execute('insert into employees values (%s, %s, %s, %s, %s,%s)',
                                (
                                    item['employee_id'],
                                    item['first_name'],
                                    item['last_name'],
                                    item['title'],
                                    item['birth_date'],
                                    item['notes']
                                ))

            # Занесение информации в таблицу "customers"
            with open(os.path.join(BASE_PATH, 'customers_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.DictReader(csv_file)
                for item in reader:
                    cur.execute('insert into customers values (%s, %s, %s)',
                                (
                                    item['customer_id'],
                                    item['company_name'],
                                    item['contact_name']
                                ))

            # Занесение информации в таблицу "orders"
            with open(os.path.join(BASE_PATH, 'orders_data.csv'), 'r', encoding='utf-8') as csv_file:
                reader = csv.DictReader(csv_file)
                for item in reader:
                    cur.execute('insert into orders values (%s, %s, %s, %s, %s)',
                                (
                                    item['order_id'],
                                    item['customer_id'],
                                    item['employee_id'],
                                    item['order_date'],
                                    item['ship_city']
                                ))

finally:
    conn.close()


