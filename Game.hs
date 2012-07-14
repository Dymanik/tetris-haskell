{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Game

where
import Board
import TetrisPiece
import System.Random


data Game = Game{
				board :: Board,
				piece :: TetrisPiece,
				nextpieces :: [BlockType]
			}



newGame ::  Int -> Int -> Int -> Game
newGame n m r = Game (newBoard n m) firstpiece shapes
		where
			rand = mkStdGen r
			(shape:shapes)= randomPieces rand
			firstpiece =  newPiece shape (n `div` 2, m-1)

			


randomPieces r = (toEnum p) : randomPieces r'
		where
			(p,r') = randomR (0,6) r



gameNewPiece ::  Game -> Game
gameNewPiece g@(Game (b) p n) = g{piece=s,nextpieces=p}
		where
			(s,p) = ( newPiece (head l) (x`div`2,y-1) ,tail l)
			l = nextpieces g
			(x,y) = boardSize b




lockPiece g@(Game b  p _) = g{board=foldl (flip addBlocktoBoard) b (blocks p)}
