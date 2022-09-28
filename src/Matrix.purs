module Matrix
  ( Matrix
  , Vector
  , column
  , columns
  , emptyMatrix
  , fromArray
  , index
  , isRectangle
  , makeMatrix
  , mapColumns
  , mapRows
  , mat
  , row
  , rows
  , transpose
  )
  where

import Prelude

import Control.Monad.Gen (chooseInt)
import Data.Array as A
import Data.Array.NonEmpty as ANE
import Data.Foldable (all)
import Data.Maybe (Maybe(..))
import Data.Maybe as M
import Data.NonEmpty as NE
import Data.String (joinWith)
import Data.Traversable (sequence)
import Partial.Unsafe (unsafePartial)
import Test.QuickCheck (class Arbitrary, arbitrary)
import Test.QuickCheck.Gen (Gen, sized, vectorOf)

data Matrix :: Int -> Int -> Type -> Type
data Matrix h w a = Matrix Int Int (ANE.NonEmptyArray (ANE.NonEmptyArray a)) | EmptyMatrix

type Vector a = ANE.NonEmptyArray a

instance Show a => Show (Matrix h w a) where
    show EmptyMatrix = "EmptyMatrix"
    show (m :: Matrix h w a) = joinWith "\n" (map show (rows m))

instance Functor (Matrix h w) where
    map f (Matrix h w a) = Matrix h w (map (map f) a)
    map _ EmptyMatrix = EmptyMatrix

instance Eq a => Eq (Matrix h w a) where
    eq (Matrix _ _ a) (Matrix _ _ b) = eq a b
    eq EmptyMatrix EmptyMatrix = true
    eq _ _ = false

instance Arbitrary a => Arbitrary (Matrix h w a) where
    arbitrary = sized arbitrarySizedMatrix

arbitrarySizedMatrix :: forall h w a . Arbitrary a => Int -> Gen (Matrix h w a)
arbitrarySizedMatrix n = do
    m <- chooseInt 1 (n + 1)
    matrix <- vectorOf (n + 1) (vectorOf m arbitrary)
    pure (Matrix (n + 1) m (unsafePartial ((ANE.fromArray >>> M.fromJust) (map (ANE.fromArray >>> M.fromJust) matrix))))

emptyMatrix :: forall h w a . Matrix h w a
emptyMatrix = EmptyMatrix

isRectangle :: forall a . ANE.NonEmptyArray (ANE.NonEmptyArray a) -> Boolean
isRectangle a = let m = map (ANE.length) a in all (eq (ANE.head m)) m

fromArray :: forall h w a . Array (Array a) -> Maybe (Matrix h w a)
fromArray a = case ANE.fromArray (map ANE.fromArray a) of
  Nothing -> Just EmptyMatrix
  Just a' -> case sequence a' of 
    Nothing -> Nothing
    Just a'' -> if isRectangle a'' then Just (Matrix (ANE.length a'') (ANE.length (ANE.head a'')) a'') else Nothing

makeMatrixRange :: Int -> Int -> Array (ANE.NonEmptyArray Int)
makeMatrixRange r cols = map (\_ -> ANE.range 0 (cols - 1)) (A.range 0 (r - 1))

makeMatrix :: forall h w a . Int -> Int -> (Int -> Int -> a) -> Matrix h w a
makeMatrix height cols f = let m = (makeMatrixRange height cols) in
    case ANE.fromArray m of
        Nothing -> EmptyMatrix
        Just m' -> Matrix height cols (ANE.mapWithIndex (\r (list :: ANE.NonEmptyArray Int) -> map (\c -> f r c) list) m')

row :: forall h w a . Int -> Matrix h w a -> Maybe (Vector a)
row n (Matrix _ _ m) = m ANE.!! n
row _ EmptyMatrix = Nothing

column :: forall h w a . Int -> Matrix h w a -> Maybe (Vector a)
column n (Matrix _ _ m) = sequence (map (_ ANE.!! n) m)
column _ EmptyMatrix = Nothing

index :: forall h w a . Int -> Int -> Matrix h w a -> Maybe a
index x y (Matrix h w m) = do
    r <- row y (Matrix h w m)
    r ANE.!! x
index _ _ EmptyMatrix = Nothing

rows :: forall h w a . Matrix h w a -> Array (Array a)
rows (Matrix _ _ m) = ANE.toArray (map ANE.toArray m)
rows EmptyMatrix = [[]]

columns :: forall h w a . Matrix h w a -> Array (Array a)
columns (Matrix _ _ m) = ANE.toArray (map ANE.toArray (ANE.transpose m))
columns EmptyMatrix = [[]]

transpose :: forall h w a . Matrix h w a -> Matrix w h a
transpose (Matrix h w m) = Matrix w h (ANE.transpose m)
transpose EmptyMatrix = EmptyMatrix

mapRows :: forall h w a b . (Vector a -> Vector b) -> Matrix h w a -> Matrix h w b
mapRows f (Matrix h w m) = Matrix h w (map f m)
mapRows _ EmptyMatrix = EmptyMatrix

mapColumns :: forall h w a b . (Vector a -> Vector b) -> Matrix h w a -> Matrix h w b
mapColumns f = transpose <<< mapRows f <<< transpose

