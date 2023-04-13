# HAProxy Basic Example

A small example of spinning up some services behind HAProxy. Nothing in this repository is remotely production ready but is just an example to get started with the relevant technologies.

## Requirements

To run this you'll need:
- Docker
- docker-compose
- Make (optional, there are useful commands in the Makefile that you can execute directly if preferred)

## The application

The stack runs two applications: bookstack (an off the shelf wiki software backed by mariadb) and an "api service" (basically an express.js hello world with a single endpoint). It places HAProxy in front of those services to provide access to both on `localhost:80`, with the bookstack application available at `/bookstack` and the api at `/api`. Additionally the api is balanced to two different container instances with basic round robin balancing.

Key files in the setup include:
- `Makefile` - helpful commands for setting up and running the stack
- `haproxy/haproxy.cfg` - configures service routing for HAProxy
- `docker-compose.yml` - configures our containers via docker-compose

Once the stack is up and running notice that neither application is directly accessible on `localhost` and must be accessed through the proxy on port 80. Also notice that when hitting `localhost:80/api` the response alternates between the two server instances defined in `docker-compose.yml`.

## Running the stack

First create the required docker images with:
```
make build-all
```

Then run the stack with:
```
make start
```

You can later stop the services with:
```
make stop
```
