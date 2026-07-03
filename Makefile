#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo certs
	@echo start / stop / restart
	@echo ----------------------
	@echo workspace
	@echo clean
	@echo ----------------------

_urls: _header
	${info }
	@echo -------------------------------------
	@echo [OpenObserve] https://openobserve.test
	@echo [Traefik] https://traefik.openobserve.test
	@echo -------------------------------------

_header:
	@echo -----------
	@echo OpenObserve
	@echo -----------

certs:
	@traefik/crear_certs.sh openobserve.test

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose down

restart: stop start

workspace:
	@docker-compose exec openobserve /bin/bash

clean:
	@docker-compose down -v --remove-orphans
