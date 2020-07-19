## WORKSHOP - SQL DATABASE

A simple MYSQL script that creates database with resources from Umuzi Photo Lab.

### Requirements:

1. mysqldump
2. Docker-compose configurations


   *  Windows: download the "MySQL Product Archives" from https://downloads.mysql.com/archives/community/. After extracting the file, add the "bin" folder (This includes mysqldump.exe) to Windows PATH so as to have it available from command line.
    * Linux: Install the MySQL Client.

    mysql_config_editor Passing passwords within the command line is a bad practice. mysql_config_editor enables you to store authentication in a .mylogin.cnf file so you don't need to pass it to the command line. For more info, go to https://dev.mysql.com/doc/refman/5.7/en/mysql-config-editor.html

    * Windows: It's also included in the "MySQL Product Archives"
    * Linux: It's part of the MySQL Client tools

To check your login paths execute the following. These login paths will be used in your JSON file.

shell> mysql_config_editor print --all
[loginpath1]
user = dbuser1
password = *****
host = yourdbhost1
[loginpath2]
user = dbuser2
password = *****
host = yourdbhost2

YAML File

Create a file containing a list of DBs to be backed up. The DB list must be in YML format. See example below:-

version: "3.3"
services:
  postgres:
    image: postgres:9.6
    environment:
      - POSTGRES_USER=myaccount
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=visitordb
    volumes:
      - ./gitignore/postgresql:/var/lib/postgresql/data
    ports:
      - 5432:5432

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

## Happy Coding