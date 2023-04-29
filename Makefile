NAME := Inception

all: $(NAME)

$(NAME):
	docker compose up -f srcs/docker-compose.yaml

clean_containers:
	@docker stop $(docker ps -qa)
	@docker rm $(docker ps -qa)

clean_images:
	@docker rmi -f $(docker images -qa)

clean_volumes:
	@docker volume rm $(docker volume ls -q)

clean_networks:
	@docker network rm $(docker network ls -q)

fclean:
	@docker system prune -a --volumes

