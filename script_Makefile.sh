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
echo "NAME = $0
"
echo 'CC = gcc

CFLAGS = -Wall -Wextra -Werror -I libft

LDFLAGS = -L libft -lft
'
echo -n "SRC = "

for file in `find . -maxdepth 1 -name "*.c"`
do
	echo -n " \\
	$file"
done
echo '

OBJ = $(SRC:.c=.o)

all: $(LIB) $(NAME)

$(NAME): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

$(LIB):
	make -C $(LIBPATH)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
'
