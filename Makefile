NAME := Inception

all: $(NAME)

$(NAME):
	@cd srcs && docker-compose up -d --build

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
