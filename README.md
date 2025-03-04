# Pagila Movie Rental Database HW
[![](https://github.com/maxplush/pagila-hw/workflows/tests/badge.svg)](https://github.com/maxplush/pagila-hw/actions?query=workflow%3Atests)

## Overview
[Pagila](https://github.com/devrimgunduz/pagila) is a standard example database for PostgreSQL that implements a simple movie rental system, similar to what the company Blockbuster might have used before digital streaming services took over. The database schema includes tables for movies, actors, customers, rentals, and other related entities.

This repository contains a version of the Pagila database, utilizing Git submodules to include the original Pagila project. The use of submodules allows for easy updates as the original Pagila database evolves over time.

<img src=dvd-rental-sample-database-diagram.png width=80% />

## Cloning the Repository
Since this repository uses Git submodules, simply cloning the repository does not retrieve the submodule files. To fully clone the repository and initialize the submodule, run the following commands:

```sh
$ git clone https://github.com/maxplush/pagila-hw
$ cd pagila-hw
$ git submodule init
$ git submodule update
```

To verify that you have correctly retrieved the Pagila database files, check that the `pagila` subfolder contains files:

```sh
$ ls pagila
```

## Setting Up the Database with Docker
This repository uses Docker to simplify database setup and execution. To bring up the PostgreSQL container and connect to it using `psql`, execute the following commands:

```sh
$ docker compose up -d --build
$ docker compose exec pg psql
```

Once inside the PostgreSQL prompt, you can confirm that the database schema is loaded correctly by running:

```sql
postgres=# \d
```

This should output a list of database tables and other schema elements, such as:

```
Schema |            Name            |       Type        |  Owner  
--------+----------------------------+-------------------+----------
public | actor                      | table             | postgres
public | actor_actor_id_seq         | sequence          | postgres
public | actor_info                 | view              | postgres
public | address                    | table             | postgres
public | address_address_id_seq     | sequence          | postgres
...
```

## Solving the SQL Problems
Inside the `sql` folder, you will find individual files, each corresponding to a specific database query problem. At the top of each file, a description explains what the SQL query should compute.

To solve the problems, follow these steps:
1. Write a single `SELECT` statement in each file that computes the desired output.
2. The `expected` folder contains the correct results for each query.
3. You can verify your solution by running the provided test script.

## Running Tests
The `run_tests.sh` script automatically verifies your queries against the expected output using the `diff` command. This script must be run inside the database container using:

```sh
$ docker compose exec pg ./run_tests.sh
```

