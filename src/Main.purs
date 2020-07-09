module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Effect.Random as R
import Graphics.Canvas as C
import Web.DOM.Document as D
import Web.Event.EventTarget as ET
import Web.Event.EventTarget as EV
import Web.HTML as H
import Web.HTML.Event.EventTypes as HET
import Web.HTML.HTMLDocument as HD
import Web.HTML.Window as HW

-- canvas: https://pursuit.purescript.org/packages/purescript-canvas/4.0.0/docs/Graphics.Canvas
-- random: https://pursuit.purescript.org/packages/purescript-random/4.0.0/docs/Effect.Random
main :: Effect Unit
main = do
    go' <- EV.eventListener go
    H.window
        >>= map HD.toDocument <<< HW.document
        >>= D.toEventTarget >>> ET.addEventListener HET.domcontentloaded (go') true
  where
    go _ = do
        randomHeight <- R.randomRange 10.0 100.0
        randomWidth <- R.randomRange 10.0 100.0
        C.getCanvasElementById "canvas"
            >>= case _ of
                Nothing -> log "Never lucky."
                Just canvas -> do
                    context <- C.getContext2D canvas
                    C.setFillStyle context "rgb(200, 0, 0)"
                    C.fillRect context (
                        { height: randomHeight
                        , width: randomWidth
                        , x: 10.0
                        , y: 10.0
                        })
