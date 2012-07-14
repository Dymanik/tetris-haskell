{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Board (
			Board,
		) where


import Block
import qualified Data.Map as M


data Board = Board {
					boardSize :: (Int,Int),
					boardBlocks :: M.Map (Int,Int) Block
					}


