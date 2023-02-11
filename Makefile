# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agaley <agaley@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/20 17:24:11 by agaley            #+#    #+#              #
#    Updated: 2023/02/11 18:46:26 by agaley           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

LIB = libftprintf.a
H = ft_printf.h
SRCS = 	ft_printf.c

MAKE_LIBFT = make -f libft/Makefile
LIBFT_FLAGS = -Llibft -lft

OBJS = ${SRCS:.c=.o}
CFLAGS = -Wall -Wextra -Werror
CC = gcc

all:	${LIB}

libft:
		${MAKE_LIBFT}

%.o:	%.c ${H} Makefile libft
		${CC} ${CFLAGS} ${LIBFT_FLAGS} $< -c

${LIB}:	${OBJS}
		ar rc ${LIB} ${OBJS}

clean:
		${MAKE_LIBFT} clean
		$(foreach obj, ${OBJS}, rm -f ${obj})
		find . -name "*.gch" -delete

fclean:	clean
		${MAKE_LIBFT} fclean
		find . -name "${LIB}" -delete
		find . -name "a.out" -delete

re:	fclean all
		make

.PHONY:	all libft clean fclean re
