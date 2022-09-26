module Test.Main where

import Prelude
import Test.Assert (assert)
import Effect (Effect)
import Effect.Class.Console (log)

main :: Effect Unit
main = do
  log "🍝"
  log "You should add some tests."
  assert (true == true)