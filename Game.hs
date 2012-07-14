module Game

where
import Board
import TetrisPiece
import System.Random


data Game = Game{
				board :: Board,
				seed :: StdGen,
				piece :: TetrisPiece,
				nextpieces :: [TetrisPiece]
			}



newGame ::  Int -> Int -> Int -> Game
newGame n m r = Game (newBoard n m) rand piece pieces
		where
			rand = mkStdGen r
			(piece:pieces)= randomPieces rand

			


randomPieces ::  RandomGen t => t -> [TetrisPiece]
randomPieces r = (newPiece (toEnum p) (0,0)) : randomPieces r'
		where
			(p,r') = randomR (0,6) r



gameNewPiece g@(Game (b) _ p n) = g{piece=s,nextpieces=p}
		where
			(s:p) = nextpieces g
			(x,y) = boardSize b
			t = s{pos=(x `div` 2,y-1)}
