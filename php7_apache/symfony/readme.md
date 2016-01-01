# PHP7 and all the symfony essential php extensions

## How to use it ?

> $ ``docker-compose up -d ``**here to start it**

And then connect to $your_docker_ip:8080 to see the result !

*By default, it links the ../../Sites folder to the root of the server, but you can chage it in the ../docker-root.yml file*

# Run a symfony app in a docker environment

**When the container is runing, open the terminal inside of it :**

> $ ``dock bash``

The command above abstract the command below (dock.sh)

> $ ``docker exec -ti container_name bash``

## Create a new project

*The symfony installer is installed on the container*

> $ ``symfony new project_name``

The command above abstract the command below (symfony.phar)

> $ ``composer create-project symfony/framework-standard-edition project_name "3.0.\*"``

## Run the project on the port 8000

And then, cd into the project folder and launch it

> $ ``cd project_name``

> $ ``sf run``

The command above abstract the command below (symfony.sh and .bashrc)

> $ ``php bin/console server:run 0.0.0.0:8000``

You can now see your app running on $your_docker_ip:8000 :)

## Symfony configuration

To see the /config.php runing on your server, add your docker-machine ip (see the php7_apache/readme.md) in the web/config.php file
