# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jfremond <jfremond@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/22 18:59:02 by jfremond          #+#    #+#              #
#    Updated: 2024/07/22 18:59:04 by jfremond         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

############
#   NAME   #
############

NAME			=	inception

################
#   COMMANDS   #
################

DOCKER_CMD		=	docker compose
DOCKER_OPT		=	-f
DOCKER_FILE		=	./srcs/docker-compose.yml
DOCKER_COMPOSE	=	$(DOCKER_CMD) $(DOCKER_OPT) $(DOCKER_FILE)

###############
#   FOLDERS   #
###############

WP_VOLUME	=	~/jfremond/data/wp_data
DB_VOLUME	=	~/jfremond/data/db_data

##############
#   COLORS   #
##############

CYAN			=	\033[0;36m
PURPLE			=	\033[0;35m
ORANGE			=	\033[38;2;255;165;0m
RESET			=	\033[0m

#############
#   RULES   #
#############

$(NAME):	all

all:
			@mkdir -p $(WP_VOLUME)
			@mkdir -p $(DB_VOLUME)
			@chmod 777 $(WP_VOLUME)
			@chmod 777 $(DB_VOLUME)
			@$(MAKE) build
			@$(MAKE) create
			@$(MAKE) start

clean:
			$(DOCKER_COMPOSE) down --rmi all

fclean:
			$(DOCKER_COMPOSE) down --rmi all --volumes
			rm -rf ~/jfremond
			$(MAKE) prune

re:			clean all

fre:		fclean all

build:
			$(DOCKER_COMPOSE) build $(c)

create:
			$(DOCKER_COMPOSE) create $(c)

start:
			$(DOCKER_COMPOSE) start $(c)

stop:
			$(DOCKER_COMPOSE) stop $(c)

ps:
			$(DOCKER_COMPOSE) ps --all

images:
			$(DOCKER_COMPOSE) images

prune:
			docker system prune -af

help:
			@echo ""
			@echo -e "$(CYAN)---------------------------------------- MAKE ----------------------------------------$(RESET)"
			@echo -e "$(CYAN)make/make all$(RESET)	->	Calls build, create, and start"
			@echo -e "$(CYAN)make clean$(RESET)		->	Stop containers, removes them with their volumes"
			@echo -e "$(CYAN)make fclean$(RESET)		->	Stop containers, removes them with their volumes and images"
			@echo -e "$(CYAN)make re$(RESET)		->	Calls clean and all"
			@echo -e "$(CYAN)make fre$(RESET)		->	Calls fclean and all"
			@echo ""
			@echo -e "$(PURPLE)---------------------------------------- ARGS ----------------------------------------$(RESET)"
			@echo -e "$(PURPLE)make build$(RESET)		->	Build services from their Dockerfiles"
			@echo -e "$(PURPLE)make create$(RESET)		->	Create services"
			@echo -e "$(PURPLE)make start$(RESET)		->	Start services"
			@echo -e "$(PURPLE)make stop$(RESET)		->	Stop running containers without removing them"
			@echo ""
			@echo -e "$(ORANGE)---------------------------------------- LIST ----------------------------------------$(RESET)"
			@echo -e "$(ORANGE)make ps$(RESET)		->	List containers for the project"
			@echo -e "$(ORANGE)make images$(RESET)		->	List images used by the containers"
			@echo ""

.PHONY:		all clean fclean re fre build create start stop ps images prune help
