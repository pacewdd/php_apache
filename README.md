# PACE WDD Apache2/PHP8.4.1 Container

This is a skeleton template for PHP courses in the PACE Web Development Diploma program.  You will need Docker Desktop installed on your system before you can use this container

Software versions:

* Apache 2.4.52
* PHP 8.4.1

## To get started...

* Download a zip file of this repository
* Rename the folder to the name of your course.  eg: `intro_php`
* Change directory into the folder and run `docker compose build`.  Note, this can take a while depending on your setup, so relax until it's done.
* You may also need the MySQL container to have a fully functioning LAMP setup, or you can just use SQLite.
* To start your container, use Docker Desktop, or open a terminal in the folder and run:

 ```bash

    docker compose up --detach

```

## Document Root

 The `public` folder inside `code` is your document root.  If you want a different folder structure, edit the `000-default.conf` file in `config/sites-available`, then restart the container.

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


## Composer

The PHP package manager `composer` is installed in `/root/bin` and
can be invoked by shelling into the container:

```bash
docker exec -it <container_id> bash
```

Find the container id by running this command:

```bash
docker container list
```

It's a good idea to install all your composer packages from within the container, as this is likely how you will install them when you deploy.


## Running multiple containers

If you have more than one php_apache container running at the same time, adjust the exposed host ports in each container's `docker-compose.yml` file so they do not conflict.

For example, if container one is running on port 8080 on the host, then container two must run on a different port:

```yml
# container 1:

ports:
      - '8080:80'

# container 2:

ports:
      - '8081:80'
```

## Using in production

If you want to deploy this container in production, make the following changes.

In `Dockerfile`, comment out the lines related to XDebug:

```bash
    # && pecl install xdebug \
    # && docker-php-ext-enable xdebug \
```

In `config/etc/php/conf.d/docker-php-ext-xdebug.ini`, comment out all lines:

```ini
# zend_extension=xdebug
# xdebug.mode=develop,debug
# xdebug.start_with_request=yes
# xdebug.client_port=9003
# xdebug.client_host=host.docker.internal
```

In `config/etc/php`, copy `php.ini-production` to `php.ini`


## NodeJS and npm

NodeJS is not installed in the container, and it is not necessary to do so for PHP development.  Instead, use your locally installed version of `node` and `npm` while working with a container that contains a Laravel app.

For example, to run a dev server for the container, simply run this command on the host:

```bash
npm run dev
```

Your container will be able to connect to the dev server through an exposed port.  

Note: you may want to close that port in `docker-compose.yml` in production, after you build your assets.




