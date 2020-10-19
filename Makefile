
# One liners and simple stuff may be here in this makefile. See sc folder for scripts.
# run scripts from project folder like this --  sc/cl

dev-up:
	docker-compose -f docker-compose.yml up

dev-rec-up:
	docker-compose -f docker-compose.yml up --build --force-recreate

dev-down:
	docker-compose -f docker-compose.yml down

dev-clean:
	docker-compose -f docker-compose.yml down --remove-orphans --rmi all

prod-up:
	docker-compose -f docker-compose.prod.yml up

prod-rec-up:
	docker-compose -f docker-compose.prod.yml up --build --force-recreate

prod-down:
	docker-compose -f docker-compose.prod.yml down

prod-clean:
	docker-compose -f docker-compose.prod.yml down --remove-orphans --rmi all

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#  other/`less common` stuff...

docker-info:
	docker --version
	docker-compose -version

docker-status:
	docker ps
	docker ps -a
	docker images
	docker volume ls

docker-clean:
	-@docker rm $$(docker ps -qa --no-trunc --filter "status=exited")
	@echo
	-@docker rmi $$(docker images | grep "^<none>" | awk '{ print $$3 }')
	@echo
	-@docker volume rm $$(docker volume ls -qf dangling=true)
