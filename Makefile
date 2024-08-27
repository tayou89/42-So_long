# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tayou <tayou@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/12 23:45:30 by tayou             #+#    #+#              #
#    Updated: 2023/05/14 19:11:17 by tayou            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Executable File Name
NAME = so_long
NAME_BONUS = so_long_bonus

# Commands for Compilation
GCC = gcc
GCC_FLAGS = -Wall -Wextra -Werror 
RM = rm
RM_FLAGS = -rf

# Path
SOURCE_PATH = sources/
OBJECT_PATH = objects/
HEADER_PATH = headers/
MANDATORY_PATH = mandatory/
BONUS_PATH = bonus/
LIBFT_PATH = libft/
MINILIBX_PATH = minilibx/

# Exterior Library
LIBFT = $(LIBFT_PATH)libft.a
MINILIBX = $(MINILIBX_PATH)libmlx.a


# Source Names
MANDATORY_NAMES = so_long \
	  			  check_map_extension \
	  			  check_map_validation \
	  			  check_map_is_rectangular check_map_surrounded_by_wall \
	  			  check_map_component check_map_has_valid_path \
	  			  check_accessibility \
	  			  get_array_map get_linked_list_map \
	  			  make_game \
	  			  make_initial_game_setting get_image_address \
	  			  when_key_is_pressed when_click_x_button_on_window \
	  			  make_player_move_to_target \
	  			  control_node \
	  			  utils_1 utils_2 \
	  			  finish_game_after_free free_functions handle_error

BONUS_NAMES = so_long \
			  check_map_extension \
			  check_map_validation \
			  check_map_is_rectangular check_map_surrounded_by_wall \
			  check_map_component check_map_has_valid_path \
			  check_accessibility \
			  get_array_map get_linked_list_map \
			  make_game \
			  make_initial_game_setting \
			  get_image_address get_player_enemy_location \
			  when_key_is_pressed when_click_x_button_on_window \
			  when_key_not_pressed \
			  make_enemy_on_guard turn_enemy_to_direction \
			  check_every_enemy_if_find_invader move_enemy_to_direction \
			  make_player_move_to_target \
			  control_node \
			  utils_1 utils_2\
			  finish_game_after_free free_functions handle_error

# Sources
MANDATORY_SOURCES = $(addprefix $(SOURCE_PATH)$(MANDATORY_PATH), $(addsuffix .c, $(MANDATORY_NAMES)))
BONUS_SOURCES = $(addprefix $(SOURCE_PATH)$(BONUS_PATH), $(addsuffix _bonus.c, $(BONUS_NAMES)))

# Objects
MANDATORY_OBJECTS = $(addprefix $(OBJECT_PATH)$(MANDATORY_PATH), $(addsuffix .o, $(MANDATORY_NAMES)))
BONUS_OBJECTS = $(addprefix $(OBJECT_PATH)$(BONUS_PATH), $(addsuffix _bonus.o, $(BONUS_NAMES)))

# Make Commands
all : $(NAME)

$(NAME) : $(MINILIBX) $(LIBFT) $(MANDATORY_OBJECTS)
	$(GCC) $(GCC_FLAGS) -L$(MINILIBX_PATH) -lmlx -framework OpenGL -framework AppKit -o $(NAME) $^

bonus : $(NAME_BONUS)

$(NAME_BONUS) : $(MINILIBX) $(LIBFT) $(BONUS_OBJECTS)
	$(GCC) $(GCC_FLAGS) -L$(MINILIBX_PATH) -lmlx -framework OpenGL -framework AppKit -o $(NAME_BONUS) $^

$(MINILIBX) :
	make -C $(MINILIBX_PATH) all 

$(LIBFT) : 
	make bonus -C $(LIBFT_PATH) all

$(OBJECT_PATH)$(MANDATORY_PATH)%.o: $(SOURCE_PATH)$(MANDATORY_PATH)%.c
	mkdir -p $(dir $@)
	$(GCC) $(GCC_FLAGS) -I$(HEADER_PATH) -o $@ -c $<

$(OBJECT_PATH)$(BONUS_PATH)%.o: $(SOURCE_PATH)$(BONUS_PATH)%.c
	mkdir -p $(dir $@)
	$(GCC) $(GCC_FLAGS) -I$(HEADER_PATH) -o $@ -c $<

clean : 
	make -C $(MINILIBX_PATH) clean
	make -C $(LIBFT_PATH) clean
	$(RM) $(RM_FLAGS) $(OBJECT_PATH)

fclean : clean
	make -C $(LIBFT_PATH) fclean
	$(RM) $(RM_FLAGS) $(NAME) $(NAME_BONUS)

re : fclean all

.PHONY : all clean fclean re libft bonus