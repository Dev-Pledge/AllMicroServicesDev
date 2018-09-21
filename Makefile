message:
	@echo "\n\n Once you have committed any changes please make sure you do a 'make git-up' to ensure your fellow DevPledge Developers can run the complete build!!! Tah! Love John x\n\n"

up:
	docker-compose -f ./sentry/docker-compose.yml up -d \
	&& docker-compose -f ./cache/docker-compose.yml up -d \
	&& docker-compose -f ./api/docker-compose.yml up -d \
	&& docker-compose -f ./feed/docker-compose.yml up -d \
	&& docker-compose -f ./ui/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d \
	&& docker ps \
	&& make message

down:
	make stop \
	&& docker-compose -f ./sentry/docker-compose.yml down \
	&& docker-compose -f ./cache/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml down \
	&& docker-compose -f ./feed/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml down \
	&& docker-compose -f ./nginx/docker-compose.yml down \
	&& docker ps

start:
	docker-compose -f ./sentry/docker-compose.yml start \
	&& docker-compose -f ./cache/docker-compose.yml start \
	&& docker-compose -f ./api/docker-compose.yml start \
	&& docker-compose -f ./feed/docker-compose.yml start \
	&& docker-compose -f ./ui/docker-compose.yml start \
	&& docker-compose -f ./nginx/docker-compose.yml start \
	&& make message

stop:
	docker-compose -f ./sentry/docker-compose.yml stop \
	&& docker-compose -f ./cache/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml stop

build:
	docker-compose -f ./sentry/docker-compose.yml build --no-cache \
	&& docker-compose -f ./cache/docker-compose.yml build --no-cache \
	&& docker-compose -f ./api/docker-compose.yml build --no-cache \
	&& docker-compose -f ./feed/docker-compose.yml build --no-cache \
	&& docker-compose -f ./ui/docker-compose.yml build --no-cache \
	&& docker-compose -f ./nginx/docker-compose.yml build --no-cache

git-pull:
	git pull \
	&& git -C api pull \
	&& git -C feed pull \
	&& git -C ui pull \
	&& git -C nginx pull \
	&& git -C cache pull

restart-ui:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

restart-feed:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml down \
	&& docker-compose -f ./feed/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml down \
	&& docker-compose -f ./feed/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d \

restart-api:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d \

build-up:
	make down \
	&& make build \
	&& make up

down-up:
	make down \
	&& make up

git-up:
	make git-pull \
	&& make build-up \
	&& make composer-feed \
	&& make message \
	&& make view

git-clean:
	make down \
	&& make remove-vendors \
	&& make docker-clean \
	&& make git-up

remove-vendors:
	rm -rf ./api/vendor \
	&& rm -rf ./feed/vendor


composer-api:
	 docker exec -ti dev_pledge_api composer install

composer-feed:
	 #docker exec -ti dev_pledge_feed composer install

composer-ui:
	 docker exec -ti dev_pledge_ui composer install

yarn-ui:
	cd ui/app/app \
	&& yarn \
	&& yarn start

npm-ui:
	cd ui/app/app \
	&& npm install \
	&& npm start

ssh-ui:
	docker exec -ti dev_pledge_ui /bin/bash

ssh-api:
	docker exec -ti dev_pledge_api /bin/bash

ssh-nginx:
	docker exec -ti dev_pledge_nginx /bin/bash

ssh-feed:
	docker exec -ti dev_pledge_feed /bin/bash

view:
	open http://dev.auth.devpledge.com \
	&& open http://dev.api.devpledge.com \
	&& open http://dev.feed.devpledge.com \
	&& open http://dev.errors.devpledge.com \
	&& open http://dev.devpledge.com

docker-clean:
	docker rmi -f $$(docker images -a -q) || docker ps

docker-prune:
	docker image prune -a -f

clear-api-data:
	rm -rf api/data

open-redis:
	open http://localhost:8081

help:
	cat README.md \
	&& make message
