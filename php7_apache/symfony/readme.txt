# Here is a container containing PHP7 and all the symfony essential php extensions + APACHE + GIT + COMPOSER + MySQL + ADMINER

## How to use it ?

> $ docker-compose up -d **here to start it**

And then connect to 192.168.99.100:8080 to see the result !

It links the c:/Users/Vincent/Develop/Sites folder to the root of the server

# Run a symfony app in a docker environment

**When the container is runing, open the open the terminal inside of it :**

> $ dock bash

The command above bind the command below (dock.sh)

> $ docker exec -ti container_name bash

## Create a new project

> $ symfony new project_name

The command above bind the command below (symfony.phar)

> $ composer create-project symfony/framework-standard-edition project_name "3.0.\*"

## Run the project on the port 8000

And then, cd into th project folder and launch it

> $ cd project_name

> $ sf run

The command above bind the command below (symfony.sh and .bashrc)

> $ php bin/console server:run 0.0.0.0:8000

You can now see your app running on 192.168.99.100:8000 :)

## Symfony configuration

To see the /config.php runing on your server, add your ip (192.168.99.1) in the web/config.php file
