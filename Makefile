up:
	docker-compose -f ./sentry/docker-compose.yml up -d \
	&& docker-compose -f ./auth/docker-compose.yml up -d \
	&& docker-compose -f ./api/docker-compose.yml up -d \
	&& docker-compose -f ./feed/docker-compose.yml up -d \
	&& docker-compose -f ./ui/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d \
	&& docker ps

down:
	make stop \
	&& docker-compose -f ./sentry/docker-compose.yml down \
	&& docker-compose -f ./auth/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml down \
	&& docker-compose -f ./feed/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml down \
	&& docker-compose -f ./nginx/docker-compose.yml down \
	&& docker ps

start:
	docker-compose -f ./sentry/docker-compose.yml start \
	&& docker-compose -f ./auth/docker-compose.yml start \
	&& docker-compose -f ./api/docker-compose.yml start \
	&& docker-compose -f ./feed/docker-compose.yml start \
	&& docker-compose -f ./ui/docker-compose.yml start \
	&& docker-compose -f ./nginx/docker-compose.yml start \

stop:
	docker-compose -f ./sentry/docker-compose.yml stop \
	&& docker-compose -f ./auth/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml stop \

build:
	docker-compose -f ./sentry/docker-compose.yml build \
	&& docker-compose -f ./auth/docker-compose.yml build \
	&& docker-compose -f ./api/docker-compose.yml build \
	&& docker-compose -f ./feed/docker-compose.yml build \
	&& docker-compose -f ./ui/docker-compose.yml build \
	&& docker-compose -f ./nginx/docker-compose.yml build

git-pull:
	git pull \
	&& git -C auth pull \
	&& git -C api pull \
	&& git -C feed pull \
	&& git -C ui pull \
	&& git -C nginx pull

restart-ui:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

restart-auth:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./auth/docker-compose.yml stop \
	&& docker-compose -f ./auth/docker-compose.yml down \
	&& docker-compose -f ./auth/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

restart-feed:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml down \
	&& docker-compose -f ./feed/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

restart-api:
	docker-compose -f ./nginx/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

build-up:
	make down \
	&& make build \
	&& make up

down-up:
	make down \
	&& make up

git-up:
	make git-pull \
	&& make build-up

yarn-ui:
	cd ui/app/test \
	&& yarn start

npm-ui:
	cd ui/app/test \
	&& npm start

ssh-ui:
	docker exec -ti dev_pledge_ui /bin/bash

ssh-api:
	docker exec -ti dev_pledge_api /bin/bash

ssh-auth:
	docker exec -ti dev_pledge_auth /bin/bash

ssh-nginx:
	docker exec -ti dev_pledge_nginx /bin/bash

ssh-feed:
	docker exec -ti dev_pledge_feed /bin/bash

