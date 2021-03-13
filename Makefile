docker_init:
	docker-compose build
docker_up:
	docker-compose up -d
docker_db_init:
	docker-compose run web rails db:create
docker_db_migrate:
	docker-compose run web rails db:migrate
docker_seed:
	docker-compose run web rails db:seed

docker_setup:
	$(MAKE) docker_init
	$(MAKE) docker_up
	$(MAKE) docker_db_init
	$(MAKE) docker_migrate

docker_web_ssh:
	docker-compose exec web /bin/bash

docker_db_ssh:
	docker-compose exec db /bin/bash
