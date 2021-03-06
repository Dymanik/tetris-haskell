{-|
  /Proyecto de Tetris/

  Programación Funcional Avanzada (CI4251)

  0.1 2012-07-13


  Johan González	07-40979
  
  Andreina García	08-10406


  
-}

module Main (main) where

import Block
import Display
import Game
import Graphics.UI.Gtk
import Graphics.UI.Gtk.OpenGL
import Graphics.UI.Gtk.Gdk.Events
import Graphics.Rendering.OpenGL
import Data.IORef

animationWaitTime = 3

main:: IO ()
main = do
	initGUI
	initGL
	
	glconfig <- glConfigNew [GLModeRGBA, GLModeDepth, GLModeDouble]
	canvasJuego <- glDrawingAreaNew glconfig
	widgetSetSizeRequest canvasJuego 330 500
	
	posicion <- newIORef (0.0, (0.0::GLfloat))
	
	onRealize canvasJuego $ withGLDrawingArea canvasJuego $ \_ -> do
		clearColor $= (Color4 0.0 0.0 0.0 0.0)
		matrixMode $= Projection
		loadIdentity
		depthFunc $= Just Less
		drawBuffer $= BackBuffers
		
	-- Pintar
	onExpose canvasJuego $ \_ -> do
		withGLDrawingArea canvasJuego $ \glwindow -> do
			clear [DepthBuffer, ColorBuffer]
			(x,y) <- Graphics.Rendering.OpenGL.get posicion
			display Block { pos = (round x,round y), col = RED }
			glDrawableSwapBuffers glwindow
		return True
	
	canvasProx <- glDrawingAreaNew glconfig
	widgetSetSizeRequest canvasProx 50 70
	
	onRealize canvasProx $ withGLDrawingArea canvasProx $ \_ -> do
		clearColor $= (Color4 0.0 0.0 0.0 0.0)
		matrixMode $= Modelview 5
		loadIdentity
		ortho 0.0 1.0 0.0 1.0 (0.0) 1.0
		depthFunc $= Just Less
		drawBuffer $= BackBuffers
	
	-- Pintar
	onExpose canvasProx $ \_ -> do
		withGLDrawingArea canvasProx $ \glwindow -> do
			clear [DepthBuffer, ColorBuffer]
			(x,y) <- Graphics.Rendering.OpenGL.get posicion
			display Block { pos = (round x,round y), col = RED }
			glDrawableSwapBuffers glwindow
		return True
	
	-- Nueva ventana
	window  <- windowNew
	set window [windowTitle := "Tetris", containerBorderWidth := 10]
	mainbox <- vBoxNew False 10
	containerAdd window mainbox
	caja <- hBoxNew False 5
	boxPackStart mainbox caja PackNatural 0
	-- Columna del juego
	col1 <- vBoxNew False 10
	-- Columna de proximo brick, puntuacion y botones
	col2 <- vBoxNew False 0
	boxPackStart caja col1 PackNatural 10
	boxPackStart caja col2 PackNatural 10
	boxPackStart col1 canvasJuego PackRepel 0
	proxPiezaBox <- vBoxNew False 5
	boxPackStart col2 proxPiezaBox PackNatural 30
	set proxPiezaBox [containerChild := canvasProx]
	puntuacionBox <- vBoxNew False 5
	boxPackStart col2 puntuacionBox PackNatural 50
	puntuacionLabel <- labelNew (Just "Puntuacion")
	puntuacion <- labelNew (Just "0")
	set puntuacionBox [containerChild := puntuacionLabel, 
						containerChild := puntuacion]
	salir <- buttonNewWithLabel "Salir"
	boxPackEnd col2 salir PackNatural 30
	widgetShowAll window
	onKeyPress window $ \(Key _ _ _ _ _ _ _ _ _ v) -> do
		accTeclado posicion v
		return True
	onClicked salir mainQuit
	onDestroy window mainQuit
	mainGUI
