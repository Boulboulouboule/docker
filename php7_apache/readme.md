# Container PHP7 + APACHE

**Contains some usefull extensions like :**

  -GIT

  -COMPOSER

  -MySQL

  -ADMINER

  *By default, it links the ../Develop/Sites folder to the root of the server, but you can chage it in the docker-compose.yml file*

## How to use it ?

> $ `docker-compose up` *here to start it*

**And then connect to $DOCKER_MACHINE_IP:8080 to see the result !**

You can find yout docker machine ip by typing the following command in your docker terminal:

> ``docker-machine ip default``

Or, if you need more infos:

> ``docker-machine inspect default``

default is the default name of a docker machine.

You can find the docker-machine installed on your computer by typing the following command

> ``docker-machine ls``
