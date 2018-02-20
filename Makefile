up:
	docker-compose -f ./sentry/docker-compose.yml up -d \
	&& docker-compose -f ./auth/docker-compose.yml up -d \
	&& docker-compose -f ./api/docker-compose.yml up -d \
	&& docker-compose -f ./feed/docker-compose.yml up -d \
	&& docker-compose -f ./ui/docker-compose.yml up -d \
	&& docker-compose -f ./nginx/docker-compose.yml up -d

down:
	docker-compose -f ./sentry/docker-compose.yml down \
	&& docker-compose -f ./auth/docker-compose.yml down \
	&& docker-compose -f ./api/docker-compose.yml dowm \
	&& docker-compose -f ./feed/docker-compose.yml down \
	&& docker-compose -f ./ui/docker-compose.yml down \
	&& docker-compose -f ./nginx/docker-compose.yml down

start:
	docker-compose -f ./sentry/docker-compose.yml start \
	&& docker-compose -f ./auth/docker-compose.yml start \
	&& docker-compose -f ./api/docker-compose.yml start \
	&& docker-compose -f ./feed/docker-compose.yml start \
	&& docker-compose -f ./ui/docker-compose.yml start \
	&& docker-compose -f ./nginx/docker-compose.yml start

stop:
	docker-compose -f ./sentry/docker-compose.yml stop \
	&& docker-compose -f ./auth/docker-compose.yml stop \
	&& docker-compose -f ./api/docker-compose.yml stop \
	&& docker-compose -f ./feed/docker-compose.yml stop \
	&& docker-compose -f ./ui/docker-compose.yml stop \
	&& docker-compose -f ./nginx/docker-compose.yml stop
