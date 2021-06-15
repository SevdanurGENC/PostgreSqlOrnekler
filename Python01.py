# -*- coding: utf-8 -*-
"""
Created on Tue Jun 15 09:55:04 2021

@author: Nano
"""

# pip install psycopg2

# Making Connection with PostgreSQL Server
import psycopg2

database_name = "postgres"
user_name = "postgres"
password = "root"
host_ip = "127.0.0.1"
host_port ="5432"

my_con = psycopg2.connect(
            database = database_name,
            user = user_name,
            password = password,
            host = host_ip,
            port = host_port
)

my_con.autocommit = True
cursor = my_con.cursor()

## Creating Cars Database

query = "CREATE DATABASE car_database"
cursor.execute(query)

database_name = "car_database"
user_name = "postgres"
password = "root"
host_ip = "127.0.0.1"
host_port ="5432"

my_db_con = psycopg2.connect(
            database = database_name,
            user = user_name,
            password = password,
            host = host_ip,
            port = host_port
)

## Creating cars table inside cars_db

create_table_query = """
CREATE TABLE IF NOT EXISTS cars (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
model INTEGER,
number TEXT,
colour TEXT,
company TEXT
);
"""

my_db_con.autocommit = True
cursor = my_db_con.cursor()
cursor.execute(create_table_query)

## Inserting Records in cars table

cars = [
    ("Aqua", 2009, "ABC123", "Red", "Toyota"),
    ("700s", 2015, "XXXX22", "Black", "BMW"),
    ("Vezel", 2018, "XXX111", "White", "Honda"),
    ("200C", 2001, "MMMM11", "Black", "Mercedez"),
    ("Vitz", 2010, "XXXX", "Red", "Toyota"),
]

car_records = ", ".join(["%s"] * len(cars))

insert_query = (
    f"INSERT INTO cars (name, model, number, colour, company) VALUES {car_records}"
)


cursor.execute(insert_query, cars)

## Reading Records from cars Table

select_cars_query = "SELECT * FROM cars"
cursor.execute(select_cars_query)

cars = cursor.fetchall()

for car in cars:
    print(car)

## Updating records in cars table

update_car_colours = """
UPDATE
cars
SET
colour = 'Blue'
WHERE
model >= 2010
"""

cursor.execute(update_car_colours)

## Deleting Records from cars table

delete_car_records = "DELETE FROM cars WHERE colour = 'Red'"

cursor.execute(delete_car_records) 
