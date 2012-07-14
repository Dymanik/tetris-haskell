{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Block (
				Color(..),
				Block(..),
				mbD,
				mbU,
				mbR,
				mbL,
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

data Block = Block {	pos::(Int,Int) ,
				col :: Color
}


mbD b@(Block (x,y) _) = b{pos=(x,y-1)}
mbU b@(Block (x,y) _) = b{pos=(x,y+1)}
mbL b@(Block (x,y) _) = b{pos=(x-1,y)}
mbR b@(Block (x,y) _) = b{pos=(x+1,y)}

