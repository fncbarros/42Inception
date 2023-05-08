MARIADB_VOL_DIR := ~/data/mariadb
WORDPRESS_VOL_DIR := ~/data/wordpress

all: up

up:
	@docker compose -f srcs/docker-compose.yaml up -d --build

down:
	@docker compose -f srcs/docker-compose.yaml down

create_vol_dirs:
	@mkdir $(MARIADB_VOL_DIR)
	@mkdir $(WORDPRESS_VOL_DIR)

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
	@rm -rf $(MARIADB_VOL_DIR) $(WORDPRESS_VOL_DIR)

re: fclean up

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean re
