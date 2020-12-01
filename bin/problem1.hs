module Main where

import Problem1

main :: IO ()
main = do
  xs <- fmap (map read . lines) getContents
  print $ part1 xs
  print $ part2 xs
