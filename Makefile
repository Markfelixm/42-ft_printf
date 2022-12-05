NAME := libftprintf.a
LIBFT_DIR := libft
LIBFT := $(LIBFT_DIR)/libft.a
SRC := \
	ft_printf \
	ft_print_utils
SRC_C := $(addsuffix .c, $(SRC))
SRC_O := $(addsuffix .o, $(SRC))
CC_FLAG := -Wall -Wextra -Werror -c

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(LIBFT)
	cp $(LIBFT) $(NAME)
	cc $(CC_FLAG) $(SRC_C)
	ar -crs $(NAME) $(SRC_O)

$(LIBFT):
	make -C $(LIBFT_DIR)

clean:
	rm -f $(SRC_O) $(BONUS_O)
	make clean -C $(LIBFT_DIR)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBFT_DIR)

re: fclean all
