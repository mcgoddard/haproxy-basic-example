build-haproxy:
	cd haproxy && docker build -t myhaproxy .

build-api:
	cd api && docker build -t myapi .

build-all: build-haproxy build-api

setup:
	mkdir -p /opt/bookstack/config && mkdir -p /opt/mariadb/config

start: setup
	docker-compose up -d

stop:
	docker-compose stop
