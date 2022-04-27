# PACE WDD Course Template

This is a skeleton template for PHP courses in the PACE Web Development Diploma program.

Software versions:

* Apache 2.4.52
* PHP 8.1.2
* MySQL 8.0.28

## To get started...

* Download a zip file of this repository
* Rename the folder to the name of your course.  eg: `intro_php`
* Follow the  instructions in `code/README.md` to setup your course repository

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

