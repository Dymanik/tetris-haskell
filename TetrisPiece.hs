module TetrisPiece(
					BlockType,
					TetrisPiece
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

data TetrisPiece = TetrisPiece { 
					piece :: BlockType,
					blocks :: [Block]
				}
				


newPiece ::  BlockType -> (Int, Int) -> TetrisPiece
newPiece Lpiece (x,y) = TetrisPiece Lpiece [Block (x-1,y) BLUE,Block (x-1,y+1) BLUE,Block (x,y+1) BLUE,Block (x+1,y+1) BLUE]
newPiece Jpiece (x,y) = TetrisPiece Lpiece [Block (x-1,y+1) ORANGE,Block (x-1,y) ORANGE,Block (x,y) ORANGE,Block (x+1,y) ORANGE]
newPiece Ipiece (x,y) = TetrisPiece Lpiece [Block (x-1,y) CYAN,Block (x,y) CYAN,Block (x+1,y) CYAN,Block (x+2,y) CYAN]
newPiece Tpiece (x,y) = TetrisPiece Lpiece [Block (x-1,y) PURPLE,Block (x,y) PURPLE,Block (x+1,y) PURPLE,Block (x,y+1) PURPLE]
newPiece Spiece (x,y) = TetrisPiece Lpiece [Block (x-1,y) RED,Block (x,y) RED,Block (x,y+1) RED,Block (x+1,y+1) RED]
newPiece Zpiece (x,y) = TetrisPiece Lpiece [Block (x-1,y+1) GREEN,Block (x,y) GREEN,Block (x,y+1) GREEN,Block (x+1,y) GREEN]
newPiece Opiece (x,y) = TetrisPiece Lpiece [Block (x,y+1) YELLOW,Block (x,y) YELLOW,Block (x+1,y+1) YELLOW,Block (x+1,y) YELLOW]
