module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Matrix as M
import Test.QuickCheck (quickCheck)

main :: Effect Unit
main = do
  testMatrix

testMatrix :: Effect Unit
testMatrix = do
    log "Testing Matrix Transpose"
    quickCheck (\(m :: M.Matrix _ _ Int) -> m == M.transpose (M.transpose m))


