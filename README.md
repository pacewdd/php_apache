# PACE WDD Apache2/PHP8.4.1 Container

This is a skeleton template for PHP courses in the PACE Web Development Diploma program.  You will need Docker Desktop installed on your system before you can use this container

Software versions:

* Apache 2.4.52
* PHP 8.4.1

## To get started...

* Download a zip file of this repository
* Rename the folder to the name of your course.  eg: `intro_php`
* Change directory into the folder and run `docker compose build`.  Note, this can take a while depending on your setup, so relax until it's done.
* Follow the  instructions in `code/README.md` to setup your course repository
* You may also need the MySQL container to have a fully functioning LAMP setup, or you can just use SQLite.
* To start your container, use Docker Desktop, or open a terminal in the folder and run `docker compose up --detach`

## Xdebug Configuration for Visual Studio Code

If you want to use XDebug with your VSCode projects, you will need to add a custom configuration to your `launch.json` or `settings.json` file.  Note, adjust the pathMappings entry to match your setup.  The `${workspaceFolder}` entry references the shared folder between your docker container and the host system.

```json

{
    "name": "Listen on Docker for Xdebug",
    "type": "php",
    "request": "launch",
    "port": 9003,
    "pathMappings": {
        "/var/www": "${workspaceFolder}"
    }
},

```



