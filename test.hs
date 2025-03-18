import System.IO (readFile, writeFile)
import Data.List (intercalate)
import Data.List.Split (splitOn)

doubleNumbers :: [Int] -> [Int]
doubleNumbers = map (*2)

processFile :: FilePath -> FilePath -> IO ()
processFile inputFile outputFile = do
    contents <- readFile inputFile
    let numbers = map read (splitOn "," contents) :: [Int]
        doubledNumbers = doubleNumbers numbers
        output = intercalate "," (map show doubledNumbers)
    writeFile outputFile output

main :: IO ()
main = processFile "input.txt" "output.txt"
