module TetrisPiece(
					BlockType,
					TetrisPiece,
					newPiece
				)
where


import Block

data BlockType = Lpiece 
				| Jpiece
				| Ipiece
				| Tpiece
				| Spiece
				| Zpiece
				| Opiece
				deriving (Eq,Enum)

data TetrisPiece = TetrisPiece { 
					piece :: BlockType,
					pos :: (Int,Int),
					blocks :: [Block]
				}
				


newPiece ::  BlockType -> (Int, Int) -> TetrisPiece
newPiece Lpiece pos@(x,y) = TetrisPiece Lpiece pos [Block (x-1,y) BLUE,Block (x-1,y+1) BLUE,Block (x,y+1) BLUE,Block (x+1,y+1) BLUE]
newPiece Jpiece pos@(x,y) = TetrisPiece Jpiece pos [Block (x-1,y+1) ORANGE,Block (x-1,y) ORANGE,Block (x,y) ORANGE,Block (x+1,y) ORANGE]
newPiece Ipiece pos@(x,y) = TetrisPiece Ipiece pos [Block (x-1,y) CYAN,Block (x,y) CYAN,Block (x+1,y) CYAN,Block (x+2,y) CYAN]
newPiece Tpiece pos@(x,y) = TetrisPiece Tpiece pos [Block (x-1,y) PURPLE,Block (x,y) PURPLE,Block (x+1,y) PURPLE,Block (x,y+1) PURPLE]
newPiece Spiece pos@(x,y) = TetrisPiece Spiece pos [Block (x-1,y) RED,Block (x,y) RED,Block (x,y+1) RED,Block (x+1,y+1) RED]
newPiece Zpiece pos@(x,y) = TetrisPiece Zpiece pos [Block (x-1,y+1) GREEN,Block (x,y) GREEN,Block (x,y+1) GREEN,Block (x+1,y) GREEN]
newPiece Opiece pos@(x,y) = TetrisPiece Opiece pos [Block (x,y+1) YELLOW,Block (x,y) YELLOW,Block (x+1,y+1) YELLOW,Block (x+1,y) YELLOW]
