{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Display (
	-- * Funciones exportadas
		-- * Funcion para mostrar un cuadro de la matriz
	display,
		-- * Manejador de eventos de teclado
	accTeclado
) where

import Block
import TetrisPiece
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT


intToFloat :: Int -> GLfloat
intToFloat n = fromInteger $ toInteger n

colorBlock :: Block -> [GLfloat]
colorBlock block = case (col block) of
	RED -> [255,0,0]
	BLUE -> [0,0,255]
	ORANGE -> [255,140,0]
	YELLOW -> [255,255,0]
	GREEN -> [127,255,0]
	PURPLE -> [148,0,211]
	otherwise -> [127,255,212]


cuadro :: Block -> IO ()
cuadro block = do
	renderPrimitive Quads $ do
		let	x = fst (pos block)
			y = snd (pos block)
			c = colorBlock block
		color $ (Color3 ((c!!0)::GLfloat) 
						((c!!1)::GLfloat) 
						((c!!2)::GLfloat))
		vertex $ (Vertex3 (intToFloat x) (intToFloat y) 0)
		vertex $ (Vertex3 (intToFloat x) (((intToFloat y)+0.05)::GLfloat) 0)
		vertex $ (Vertex3 (((intToFloat x)+0.07)::GLfloat) (((intToFloat x)+0.05)::GLfloat) 0)
		vertex $ (Vertex3 (((intToFloat x)+0.07)::GLfloat) (intToFloat y) 0)


display :: Block -> IO ()
display block = do
	let	x = fst (pos block)
		y = snd (pos block)
	translate $ Vector3 (intToFloat x) (intToFloat y) 0
	preservingMatrix $ do
		cuadro block
	--flush




displayTB :: TetrisPiece -> IO ()
displayTB tb = do
	preservingMatrix $ do
		mapM_ display (blocks tb)



accTeclado p (Just 'h') = do
	(x,y) <- get p
	p $= (x-0.1,y)
accTeclado p (Just 'k') = do
	(x,y) <- get p
	p $= (x+0.1,y)
accTeclado p (Just 'u') = do
	(x,y) <- get p
	p $= (x,y+0.1)
accTeclado p (Just 'j') = do
	(x,y) <- get p
	p $= (x,y-0.1)
accTeclado _ _ = return ()