module Board (
			Board,
		) where


import Block
import qualified Data.Map as M


data Board = Board {
					boardSize :: (Int,Int),
					boardBlocks :: M.Map (Int,Int) Block
					}


