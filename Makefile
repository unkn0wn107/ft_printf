# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agaley <agaley@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/20 17:24:11 by agaley            #+#    #+#              #
#    Updated: 2023/02/13 00:24:43 by agaley           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

LIB = libftprintf.a
H = ft_printf.h
SRCS = 	ft_printf.c

LIBFT_FLAGS = -Llibft -lft
MAKE_LIBFT = make -C libft

OBJS = ${SRCS:.c=.o}
CFLAGS = -Wall -Wextra -Werror
CC = gcc

all:	${LIB}

libft:
		$(MAKE_LIBFT)

%.o:	%.c ${H} Makefile libft
		${CC} ${CFLAGS} $< -c ${LIBFT_FLAGS}

${LIB}: ${OBJS}
		cp libft/libft.a ${LIB}
		ar rcs $@ ${OBJS}

clean:
		$(MAKE_LIBFT) $@
		$(foreach obj, ${OBJS}, rm -f ${obj})
		find . -name "*.gch" -delete

fclean:	clean
		$(MAKE_LIBFT) $@
		find . -name "${LIB}" -delete
		find . -name "a.out" -delete

re:	fclean all

.PHONY:	all libft clean fclean re
