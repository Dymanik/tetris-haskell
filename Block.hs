module Block (
				Color(..),
				Block(..),
			)
	where

data Color = RED
			| BLUE
			| ORANGE
			| YELLOW
			| GREEN
			| PURPLE
			| CYAN
			| GREY

data Block = Block {	position::(Int,Int) ,
				color :: Color
}


