# How to build and use Docker for Rails project with MySQL ???

#### 1. We have to install Docker and Docker Compose on Ubuntu
* Can follow this link: https://phoenixnap.com/kb/install-docker-compose-ubuntu
* Confirm that Docker and Docker Compose were installed successfully by: <br>
`docker -v` and `docker-compose -v` (using `sudo` if necessary)

#### 2. Build and run
* First, we build environment and config for our project.
```
docker-compose build
docker-compose run app bash (now, we'll access to virtual environment)
rails new . --database=mysql
cp config/database.yml config/database.yml.example 
```  
* We give permission for our folder project (777). <br>
After that, open `config/database.yml` and change:
```
  username: root
  password: root
  host: mysql
```
* Change database name and open previous terminal window that in virtual environment. Run `rails db:create` 
to create database. 
* Now, we run `docker-compose up`, open browser and access:
```
localhost:3000 (to access Rails project)
localhost:8080 (to access Adminer)
```
