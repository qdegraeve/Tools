#!/bin/bash

echo '# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdegraev <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/07 08:41:32 by qdegraev          #+#    #+#              #
#    Updated: 2015/12/11 19:03:26 by qdegraev         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


LIBPATH = libft
LIB = $(LIBPATH)/libft.a
'
echo "NAME = $1
"
echo 'CC = gcc

VPATH = src

INCLUDES = include/

CFLAGS = -Wall -Wextra -Werror

LDFLAGS = -L libft -lft
'
echo -n "SRC = "

for file in `find ./src -maxdepth 1 -name "*.c" | xargs -n 1 basename`
do
	echo -n " \\
	$file"
done
echo '

OBJ = $(SRC:.c=.o)

all: $(LIB) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -I $(INCLUDES) -o $@ -c $<

$(LIB):
	make -C $(LIBPATH)

clean: $(OBJ)
	make clean -C $(LIBPATH)
	rm -f $(OBJ)

fclean: clean
	make fclean -C $(LIBPATH)
	rm -f $(NAME)

re: fclean all

.PHONY: all re clean flcean
'
