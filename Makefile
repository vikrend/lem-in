# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: astrelov <astrelov@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/20 08:39:20 by astrelov          #+#    #+#              #
#    Updated: 2018/07/20 09:02:41 by null             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =				lem-in

CFLAGS = 			-Wall -Wextra -Werror

HEADERS = 			-I ./includes

OBJDIR = 			obj/

SRC =				src/main.c \
					src/check_input_line.c \
					src/init_ants.c \
					src/add_room.c \
					src/add_rooms_link.c \
					src/init_rooms.c \
					src/move_ants.c \
					src/lst.c \
					src/helpers.c \
					src/check_rooms.c

OBJS =				$(patsubst src/%.c, $(OBJDIR)%.o, $(SRC))

objdir:
					@mkdir -p $(OBJDIR)

$(OBJDIR)%.o:		src/%.c
					gcc $(CFLAGS) $(HEADERS) -c $< -o $@

$(NAME):			$(OBJS)
					@gcc $(CFLAGS) -o $(NAME) $(OBJS) -L ./libft -lft
					@printf "\033[0;32mlem-in: DONE\033[0m\n"

all:				| objdir
					make --directory=./libft
					make $(NAME)

clean:
					@rm -rf $(OBJDIR)
					@make --directory=./libft clean
					@printf "\033[0;32mclean: DONE\033[0m\n"

fclean:
					@rm -rf $(OBJDIR)
					@rm -rf $(NAME)
					@make --directory=./libft fclean
					@printf "\033[0;32mfclean: DONE\033[0m\n"

re:
					@rm -rf $(OBJDIR)
					@rm -rf $(NAME)
					@make --directory=./libft fclean
					@make all

.PHONY:				all clean fclean re

.NOTPARALLEL:		all clean fclean re
