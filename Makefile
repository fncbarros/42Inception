MARIADB_VOL_DIR := ~/data/mariadb
WORDPRESS_VOL_DIR := ~/data/wordpress

all: up

up:
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down

create_vol_dirs:
	@mkdir $(MARIADB_VOL_DIR)
	@mkdir $(WORDPRESS_VOL_DIR)

clean_containers: down
	@docker container prune

clean_images:
	@docker image prune -a -f

clean_volumes:
	@docker volume prune

clean_networks:
	@docker network prune

clean: down clean_containers clean_images

fclean: clean
	@docker system prune -a --volumes
	@sudo rm -rf $(MARIADB_VOL_DIR) $(WORDPRESS_VOL_DIR)

re: fclean up

.PHONY: all up down clean_containers clean_images clean_volumes clean_networks fclean re
