module Main where

import Problem1

import Criterion.Main

commonEnv :: IO [Integer]
commonEnv = map read . lines <$> readFile "data/day1.txt"

part1bench :: [Integer] -> Benchmarkable
part1bench = whnf part1

part2bench :: [Integer] -> Benchmarkable
part2bench = whnf part2

main :: IO ()
main = defaultMain [
  bgroup "day1" [ env commonEnv $ bench "part1" . part1bench
                , env commonEnv $ bench "part2" . part2bench
                ]
  ]
