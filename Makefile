
VOLUMES := ${docker volume ls -qa}

all: up

up:
	@docker-compose -f srcs/docker-compose.yaml up -d --build

down:
	@docker-compose -f srcs/docker-compose-yaml down

clean_containers:
	@docker kill $(docker ps -qa)
	@docker rm $(docker ps -qa)

clean_images:
	@docker rmi -f $(docker images -qa)

clean_volumes:
	@docker volume rm ${VOLUMES}

clean_networks:
	@docker network rm $($DOCKER network ls -aq)

clean: clean_containers clean_images

fclean:
	@docker system prune -a --volumes

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean