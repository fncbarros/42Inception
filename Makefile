
all: up

up:
	@docker compose -f srcs/docker-compose.yaml up -d --build

down:
	@docker compose -f srcs/docker-compose.yaml down

clean_containers: down
	@docker ps --filter status=exited -q | xargs docker rm

clean_images:
	@docker image prune -a -f

clean_volumes:
	@docker volume prune

clean_networks:
	@docker network prune

clean: clean_containers clean_images

fclean: down
	@docker system prune -a --volumes

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean
