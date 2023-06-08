MARIADB_VOL_DIR := ~/data/mariadb
WORDPRESS_VOL_DIR := ~/data/wordpress

all: up

up: create_vol_dirs
	@docker compose -f srcs/docker-compose.yml --project-name inception up -d --build

down:
	docker volume rm $(docker volume ls -q)
	@docker compose -f srcs/docker-compose.yml down # <---not working for some reason

create_vol_dirs:
	@sudo mkdir -p $(MARIADB_VOL_DIR)
	@sudo mkdir -p $(WORDPRESS_VOL_DIR)

clean_containers: down
	@docker container prune

clean_images: down
	@docker image prune -a -f

clean_volumes: down
	@docker volume rm $(docker volume ls -q)
	# @docker volume prune # <---not working for some reason

clean_networks:
	@docker network prune

clean: down clean_containers clean_images

fclean: clean
	@docker system prune -a --volumes
	@sudo rm -rf $(MARIADB_VOL_DIR) $(WORDPRESS_VOL_DIR)

re: fclean up

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean re
