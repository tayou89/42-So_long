/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   check_map_component_bonus.c                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tayou <tayou@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/23 22:28:54 by tayou             #+#    #+#             */
/*   Updated: 2023/05/07 19:07:37 by tayou            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long_bonus.h"

void	initialize_component_count(t_data *game);
void	get_component_count(t_data *game);
int		check_if_has_other_character(t_data *game);

int	check_map_component(t_data *game)
{
	game->error_number = 3;
	initialize_component_count(game);
	get_component_count(game);
	if (game->count.exit != 1 || game->count.collectible < 1
		|| game->count.player != 1 || game->count.enemy < 1)
		return (FALSE);
	if (check_if_has_other_character(game) == FALSE)
		return (FALSE);
	return (TRUE);
}

void	initialize_component_count(t_data *game)
{
	game->component.wall = '1';
	game->component.empty_space = '0';
	game->component.collectible = 'C';
	game->component.exit = 'E';
	game->component.player = 'P';
	game->component.enemy = 'B';
	game->count.exit = 0;
	game->count.collectible = 0;
	game->count.player = 0;
	game->count.enemy = 0;
}

void	get_component_count(t_data *game)
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
			if (map[i][j] == game->component.exit)
				game->count.exit++;
			else if (map[i][j] == game->component.collectible)
				game->count.collectible++;
			else if (map[i][j] == game->component.player)
				game->count.player++;
			else if (map[i][j] == game->component.enemy)
				game->count.enemy++;
			j++;
		}
		i++;
	}
}

int	check_if_has_other_character(t_data *game)
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
			if (map[i][j] == game->component.empty_space
				|| map[i][j] == game->component.wall
				|| map[i][j] == game->component.collectible
				|| map[i][j] == game->component.exit
				|| map[i][j] == game->component.player
				|| map[i][j] == game->component.enemy)
				j++;
			else
				return (FALSE);
		}
		i++;
	}
	return (TRUE);
}
