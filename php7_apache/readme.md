# Container PHP7 that just work :)

**Contains some usefull extensions like :**

  -GIT

  -COMPOSER

  -MySQL

  -ADMINER

  *By default, it links the ../Develop/Sites folder to the root of the server, but you can chage it in the docker-compose.yml file*

## How to use it ?

### Start the container

> $ `docker-compose up` *in this folder to start it*

**And then connect to $DOCKER_MACHINE_IP:8080 to see the result !**

You can find yout docker machine ip by typing the following command in your docker terminal:

> ``docker-machine ip default``

Or, if you need more infos:

> ``docker-machine inspect default``

default is the default name of a docker machine.

You can find the docker-machine active on your computer by typing the following command

> ``docker-machine active``

### Connect to MySQL using adminer

***First, find the ip of your mysql container by pinging it from a linked container.***

> ``dock bash your_php_or_adminer_container``

> ``ping your_mysql_container``

Mine is 172.17.0.4 for example

***Then, go to your adminer homepage and conect to mysql***

Adminer homepage : http://$DOCKER_MACHINE_IP:3306/

Host : 172.17.0.4

User : root

Password : your_root_password
