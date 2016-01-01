# DOCKER CONTAINERS

*Here you can find the differents docker containers, their configurations files and some shell scripts that will make your docker life easier*

## php7_apache directory

***Containers based on php7 and apache that just works***

*It's including some extensions like :*

  -Git

  -Xdebug

  -Opcache

## nodejs directory

***Soon there will be some nodejs containers here***

## lab directory

***I'm testing some curious things here, enter at your own risks :)***


## dock . sh:

***Contains some shortcuts that will help you with the docker commands like :***

> $ ``dock bash``

*Is the command for:*

> ``docker exec -ti $CONTAINER_NAME bash``

*The ohers commands :*

> $ ``dock build``
> $ ``dock stop``
> $ ``dock start``
> $ ``dock remove``
***All the commands are working automatically on the name of your doker container. The only things you have to do is add this name manually in th dock . sh file, like that :***

*dock . sh* :
> ``CONTAINER_NAME="my_container_name"``
