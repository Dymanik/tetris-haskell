{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module TetrisBlock(
					BlockType,
					TetrisBlock
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

data TetrisBlock = TetrisBlock { 
					piece :: BlockType,
					blocks :: Block
				}
				

