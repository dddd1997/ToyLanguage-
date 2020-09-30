import ToyTokens
import ToyGrammar
import ToyTypes
import ToyEval
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           putStrLn ("Parsing : " ++ sourceText)
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg) ++ "\n")
           
          
          --static type check, because its happening before we actually run the program. 
          --in order to enforce a dynamic type check we have to do type checking during program execution, i.e. during the 'evalLoop'. 

          --dynamic type checking is making a type checker that checks during execution. 
          

          
           
           let (result,t) = (evalLoop (parsedProg)) 
           
           putStrLn ("Evaluates to " ++ (unparse result) ++ "\n") 
           
           putStrLn ("type: " ++ unparseType t)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()


