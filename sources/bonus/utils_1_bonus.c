/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils_1_bonus.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tayou <tayou@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/23 22:34:13 by tayou             #+#    #+#             */
/*   Updated: 2023/05/02 15:38:10 by tayou            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long_bonus.h"

int	pass_white_space(char *string)
{
	int	i;

	i = 0;
	while ((string[i] >= 9 && string[i] <= 13) || string[i] == 32)
		i++;
	return (i);
}

void	switch_newline_to_null(char *string)
{
	char	*newline_string;

	newline_string = ft_strchr(string, '\n');
	if (newline_string != (void *) 0)
		newline_string[0] = '\0';
}

char	get_last_character(char *string)
{
	int	i;

	i = 0;
	while (string[i] != '\0')
		i++;
	if (i == 0)
		return ('\0');
	else
		return (string[i - 1]);
}

char	*get_last_line(char **string)
{
	int	i;

	if (*string == (void *) 0)
		return ((void *) 0);
	i = 0;
	while (string[i + 1] != (void *) 0)
		i++;
	return (string[i]);
}

void	get_component_location(char component, t_data *game)
{
	char	**map;
	int		i;
	int		j;

	map = game->map.array;
	i = 0;
	while (map[i] != (void *) 0)
	{
		j = 0;
		while (map[i][j] != '\0')
		{
			if (map[i][j] == component)
			{
				game->component.map_x = j;
				game->component.map_y = i;
				return ;
			}
			j++;
		}
		i++;
	}
}
