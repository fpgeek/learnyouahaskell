module Main where

import Control.Monad

main :: IO ()
main = putStrLn "solveMayRPN"

solveRPN :: String -> Maybe Double
solveRPN st = do
	[result] <- foldM foldingFunction [] (words st)
	return result

foldingFunction :: [Double] -> String -> Maybe [Double]
foldingFunction (x:y:ys) "*" = return $ (x * y):ys
foldingFunction (x:y:ys) "+" = return $ (x + y):ys
foldingFunction (x:y:ys) "-" = return $ (y - x):ys
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x,"")] 	-> Just x
                                _ 			-> Nothing