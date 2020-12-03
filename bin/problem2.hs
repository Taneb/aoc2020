module Main where

import Text.ParserCombinators.ReadP

isValidPassword :: Int -> Int -> Char -> String -> Bool
isValidPassword l h c p = let occurences = length $ filter (== c) p
  in occurences >= l && occurences <= h

isValidPassword2 :: Int -> Int -> Char -> String -> Bool
isValidPassword2 l h c p = (length p >= (l) && p !! (l-1) == c) /= (length p >= (h) && p !! (h-1) == c)

readInput :: ReadP (Int, Int, Char, String)
readInput = do
  l <- readS_to_P reads
  char '-'
  h <- readS_to_P reads
  char ' '
  c <- get
  char ':'
  char ' '
  s <- many get
  eof
  return (l,h,c,s)

main :: IO ()
main = do
  i <- lines <$> getContents
  let o = [(isValidPassword l h c s, isValidPassword2 l h c s) | i' <- i, let [((l,h,c,s), "")] = readP_to_S readInput i']
  print $ length . filter fst $ o
  print $ length . filter snd $ o
