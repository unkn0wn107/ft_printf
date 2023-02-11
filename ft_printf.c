/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agaley <agaley@student.42lyon.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/11 18:00:56 by agaley            #+#    #+#             */
/*   Updated: 2023/02/12 00:21:35 by agaley           ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	ft_putflag(char flag, va_list args)
{
	int	size;

	size = 0;
	if (flag == '%')
		ft_putchar_fd('%', 1);
	else if (flag == 'c')
		ft_putchar_fd(va_arg(args, int), 1);
	else if (flag == 'd' || flag == 'i')
		size += ft_putnbr_fd(va_arg(args, int), 1);
	else if (flag == 'p')
		size += ft_putptr_fd(va_arg(args, void *), 1);
	else if (flag == 's')
		size += ft_putstr_fd(va_arg(args, char *), 1);
	else if (flag == 'u')
		size += ft_putunnbr_fd(va_arg(args, unsigned int), 1);
	else if (flag == 'x')
		size += ft_putlowhex_fd(va_arg(args, unsigned int), 1);
	else if (flag == 'X')
		size += ft_putuphex_fd(va_arg(args, unsigned int), 1);
	if (flag == '%' || flag == 'c')
		size++;
	return (size);
}

int	ft_printf(const char *format, ...)
{
	va_list	args;
	int		i;
	int		size;

	va_start(args, format);
	i = 0;
	size = 0;
	while (format[i])
	{
		if (format[i] == '%')
		{
			i++;
			size += ft_putflag(format[i], args);
		}
		else
		{
			ft_putchar_fd(format[i], 1);
			size++;
		}
		i++;
	}
	va_end(args);
	return (size);
}
