module Problem1 where

part1 :: [Integer] -> Integer
part1 input = case [x * y | x <- input, y <- input, x + y == 2020] of
  (solution:_) -> solution
  [] -> error "No solution!"

part2 :: [Integer] -> Integer
part2 input = case [x * y * z | x <- input, y <- input, z <- input, x + y + z == 2020] of
  (solution:_) -> solution
  [] -> error "No solution!"

