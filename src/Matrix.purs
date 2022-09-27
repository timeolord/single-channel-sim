module Matrix
  ( Matrix(..)
  , Vector(..)
  , column
  , columns
  , index
  , mapColumns
  , mapRows
  , row
  , rows
  , transpose
  )
  where

import Data.Maybe
import Data.Traversable
import Prelude

import Data.Array as A

newtype Matrix a = Matrix (Array (Array a))
type Vector a = Array a

instance Show a => Show (Matrix a) where
    show (Matrix m) = show m

instance Functor Matrix where
    map f (Matrix a) = Matrix (map (map f) a)

row :: forall a . Int -> Matrix a -> Maybe (Vector a)
row n (Matrix m) = m A.!! n

column :: forall a . Int -> Matrix a -> Maybe (Vector a)
column n (Matrix m) = sequence (map (_ A.!! n) m)

index :: forall a . Int -> Int -> Matrix a -> Maybe a
index x y (Matrix m) = do
    r <- row y (Matrix m)
    r A.!! x

rows :: forall a . Matrix a -> Array (Array a)
rows (Matrix m) = m

columns :: forall a . Matrix a -> Array (Array a)
columns (Matrix m) = A.transpose m

transpose :: forall a . Matrix a -> Matrix a
transpose = Matrix <<< columns

mapRows :: forall a b . (Vector a -> Vector b) -> Matrix a -> Matrix b
mapRows f (Matrix m) = Matrix (map f m)

mapColumns :: forall a b . (Vector a -> Vector b) -> Matrix a -> Matrix b
mapColumns f = transpose <<< mapRows f <<< transpose

