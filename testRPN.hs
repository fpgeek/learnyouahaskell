import Test.HUnit
import RPN

main :: IO ()
main = do
	runTestTT allTests
	return ()
	
testCase1 = "test1" ~: do
					(-4) @=? solveRPN "10 4 3 + 2 * -"
					solveRPN "2 3 +" == (5) @? "solveRPN 2"
					assert $ solveRPN "90 34 12 33 55 66 + * - +" == (-3947)
testCase2 = "test2" ~: do
					assertEqual "solveRPN 4" (4037) $ solveRPN "90 34 12 33 55 66 + * - + -"
					assertEqual "solveRPN 5" (4037) $ solveRPN "90 34 12 33 55 66 + * - + -"
					assertEqual "solveRPN 6" (87) $ solveRPN "90 3 -"
	
allTests = test [testCase1, testCase2]