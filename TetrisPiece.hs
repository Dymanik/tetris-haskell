module TetrisPiece
where


import Block

data BlockType = Lpiece 
				| Jpiece
				| Ipiece
				| Tpiece
				| Spiece
				| Zpiece
				| Opiece
				deriving (Show,Eq,Enum)

data TetrisPiece = TetrisPiece { 
					shape :: BlockType,
					blocks :: [Block]
				}
			


moveDown t@(TetrisPiece _ b) = t{blocks=(map mbD b)}
moveUp t@(TetrisPiece _ b) = t{blocks=(map mbU b)}
moveLeft t@(TetrisPiece _ b) = t{blocks=(map mbL b)}
moveRight t@(TetrisPiece _ b) = t{blocks=(map mbR b)}


newPiece ::  BlockType -> (Int, Int) -> TetrisPiece
newPiece Lpiece (x,y) = TetrisPiece Lpiece [Block (x,y) BLUE,Block (x-1,y) BLUE,Block (x+1,y) BLUE,Block (x+1,y+1) BLUE]
newPiece Jpiece (x,y) = TetrisPiece Jpiece [Block (x,y) ORANGE,Block (x-1,y) ORANGE,Block (x-1,y+1) ORANGE,Block (x+1,y) ORANGE]
newPiece Ipiece (x,y) = TetrisPiece Ipiece [Block (x,y) CYAN,Block (x-1,y) CYAN,Block (x+1,y) CYAN,Block (x+2,y) CYAN]
newPiece Tpiece (x,y) = TetrisPiece Tpiece [Block (x,y) PURPLE,Block (x-1,y) PURPLE,Block (x+1,y) PURPLE,Block (x,y+1) PURPLE]
newPiece Spiece (x,y) = TetrisPiece Spiece [Block (x,y) RED,Block (x-1,y) RED,Block (x,y+1) RED,Block (x+1,y+1) RED]
newPiece Zpiece (x,y) = TetrisPiece Zpiece [Block (x,y) GREEN,Block (x-1,y+1) GREEN,Block (x,y+1) GREEN,Block (x+1,y) GREEN]
newPiece Opiece (x,y) = TetrisPiece Opiece [Block (x,y) YELLOW,Block (x,y+1) YELLOW,Block (x+1,y+1) YELLOW,Block (x+1,y) YELLOW]
