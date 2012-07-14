{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Board (
			Board(..),
			newBoard
		) where


import Block
import qualified Data.Map as M
import qualified Data.Foldable as F
import qualified Data.Sequence as S


data Board = Board {
					boardSize :: (Int,Int),
					boardBlocks :: M.Map (Int,Int) Block
					}

instance Show Board where
	show  = unlines . boardlines
		where
			boardlines (Board (x,y) b) = do
							m<-[(y-1), (y-2)..0]
							return $ do 
									n<-[0..x-1]
									return $ maybe ('.') (\_ ->'#') (M.lookup (n,m) b)
								

newBoard :: Int -> Int -> Board
newBoard n m = Board (n,m) borders
		where
			borders = F.foldr (addBlock ) M.empty borderblocks
			borderblocks = l S.>< b S.>< r
			l = S.fromList [Block (0,y) GREY | y <- [1..m-1]]
			r = S.fromList [Block (n-1,y) GREY | y <- [1..m-1]]
			b = S.fromList [Block (x,0) GREY | x <- [0..n-1]]


addBlock :: Block -> M.Map (Int, Int) Block -> M.Map (Int, Int) Block
addBlock  b@(Block x _) = M.insert x b 


