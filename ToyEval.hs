-- Author: Julian Rathke, 2018
-- Provides a CEK implementation of the \Toy language from the lecture notes
module ToyEval where
import ToyGrammar
import ToyTypes 

--Data structures as defined in ToyGrammar:
--data ToyType = TyInt | TyBool | TyUnit | TyPair ToyType ToyType | TyFun ToyType ToyType
--type Environment = [ (String,Expr) ]
--data Expr = TmInt Int | TmTrue | TmFalse | TmUnit | TmCompare Expr Expr 
--           | TmPair Expr Expr | TmAdd Expr Expr | TmVar String 
--           | TmFst Expr | TmSnd Expr
--           | TmIf Expr Expr Expr | TmLet String ToyType Expr Expr
--           | TmLambda String ToyType Expr | TmApp Expr Expr
--           | Cl ( String ToyType Expr Environment)

data Frame = HCompare Expr Environment 
           | CompareH Expr
           | HAdd Expr Environment | AddH Expr
           | HPair Expr Environment | PairH Expr
           | FstH | SndH 
           | HIf Expr Expr Environment | HLet String ToyType Expr Environment
           | HApp Expr Environment | AppH Expr
type Kontinuation = [ Frame ]

type State = (Expr,Environment,Kontinuation,TypeEnvironment)

-- Function to unpack a closure to extract the underlying lambda term and environment
unpack :: Expr -> (Expr,Environment)
unpack (Cl x t e env1) = ((TmLambda x t e) , env1)
unpack e = (e,[])

-- Look up a value in an environment and unpack it
getValueBinding :: String -> Environment -> (Expr,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = unpack e
                              | otherwise = getValueBinding x env

update :: Environment -> String -> Expr -> Environment
update env x e = (x,e) : env

-- Checks for terminated expressions
isValue :: Expr -> Bool
isValue (TmInt _) = True
isValue TmTrue = True
isValue TmFalse = True
isValue TmUnit = True
isValue (TmPair e1 e2) = isValue e1 && isValue e2
isValue (Cl _ _ _ _) = True
isValue _ = False

--Small step evaluation function. 
eval1 :: State -> State
eval1 ((TmVar x),env,k,tenv) = (e',env',k,tenv) 
                    where (e',env') = getValueBinding x env 
                          getBinding x tenv = typeOf tenv e'
                  
-- Rule for terminated evaluations
eval1 (v,env,[],tenv) | isValue v = (v,env,[],tenv) 





-- Evaluation rules for less than operator

--convert variables to values first. 
eval1((TmCompare (TmVar x) e1),env,k,tenv) = (TmVar x, env,(HCompare e1 env):k,tenv) 
eval1((TmCompare e1 (TmVar x)),env,k,tenv) = (TmVar x, env,(HCompare e1 env):k,tenv) 

eval1(v,env,(HCompare e1 env'):k,tenv) | isValue v && not ((typeOf tenv v, typeOf tenv e1)== (TyInt,TyInt))  = (TmCompare v e1,env',k,tenv)   


--implicit casting converting booleans to ints. 
eval1((TmCompare (TmTrue) e2),env,k,tenv) = ((TmCompare (TmInt 1) e2),env,k,tenv)
eval1((TmCompare (TmFalse) e2),env,k,tenv) = ((TmCompare (TmInt 0) e2),env,k,tenv) 
eval1((TmCompare e1 (TmTrue)), env,k,tenv) = ((TmCompare e1 (TmInt 1)),env,k,tenv) 
eval1((TmCompare e1 (TmFalse)), env,k,tenv) = ((TmCompare e1 (TmInt 0)),env,k,tenv) 



--best effort semantics for comparing tuples 
eval1((TmCompare (TmPair e1 e2)(TmPair e3 e4)),env,k,tenv ) = ((TmPair (TmCompare e1 e3)(TmCompare e2 e4),env,k,tenv))
eval1((TmCompare (TmPair e1 e2)(TmInt v)),env,k,tenv) = (TmPair (TmCompare e1 (TmInt v)) (TmCompare e2 (TmInt v)), env,k,tenv)
eval1(TmCompare (TmInt v)(TmPair e1 e2),env,k,tenv) = (TmPair (TmCompare (TmInt v) e1) (TmCompare (TmInt v) e2),env,k,tenv)

--comparing two values, that should be integers. 
eval1 ((TmCompare e1 e2),env,k,tenv) | (TyInt,TyInt) == (typeOf tenv e1, typeOf tenv e2) = (e1,env,(HCompare e2 env):k,tenv) 
                                | otherwise = error " Type Error: can only compare integers"
                                      
eval1 ((TmInt n),env1,(HCompare e env2):k,tenv) = (e,env2,(CompareH (TmInt n)) : k,tenv)   

eval1 ((TmInt m),env,(CompareH (TmInt n)):k,tenv) | n < m = (TmTrue,[],k,tenv)
                                             | otherwise = (TmFalse,[],k,tenv)
                                            

-- Evaluation rules for plus operator

--evaluate variables first. 
eval1((TmAdd (TmVar x) e1),env,k,tenv) = (TmVar x, env,(HAdd e1 env):k,tenv) 
eval1((TmAdd e1 (TmVar x)),env,k,tenv) = (TmVar x, env,(HAdd e1 env):k,tenv) 
--ensure we are not matching with straight forward integer addition.
eval1(v,env,(HAdd e1 env'):k,tenv) | isValue v && not ((typeOf tenv v, typeOf tenv e1)== (TyInt,TyInt))  = (TmAdd v e1,env',k,tenv)   



--best effort semantics for pairs. 
eval1 ((TmAdd (TmPair e1 e2) (TmPair e3 e4)),env,k,tenv) = ((TmPair (TmAdd e1 e3)(TmAdd e2 e4)),env,k,tenv)
eval1((TmAdd(TmPair e1 e2)(TmInt v)),env,k,tenv) = (TmPair (TmAdd e1 (TmInt v)) (TmAdd e2 (TmInt v)), env,k,tenv)
eval1(TmAdd (TmInt v)(TmPair e1 e2),env,k,tenv) = (TmPair (TmAdd (TmInt v) e1) (TmAdd (TmInt v) e2),env,k,tenv)

--convert booleans to ints. 
eval1((TmAdd (TmFalse) e2),env,k,tenv) = ((TmAdd (TmInt 0) e2),env,k,tenv) 
eval1((TmAdd (TmTrue) e2),env,k,tenv) = ((TmAdd (TmInt 1) e2),env,k,tenv)

eval1((TmAdd e1 (TmFalse)),env,k,tenv) = ((TmAdd e1 (TmInt 0),env,k,tenv))
eval1((TmAdd e1 (TmTrue)),env,k,tenv) = ((TmAdd e1 (TmInt 1),env,k,tenv))



--execute addition of integers. 
eval1 ((TmAdd e1 e2),env,k,tenv) | (TyInt,TyInt) == (typeOf tenv e1, typeOf tenv e2) = (e1,env,(HAdd e2 env):k,tenv)
                                 | otherwise = error "Can only add integers" 
--addition of pure ints. 
eval1 ((TmInt n),env1,(HAdd e env2):k,tenv) = (e,env2,(AddH (TmInt n)):k,tenv)  
eval1 ((TmInt m),env,(AddH (TmInt n)):k,tenv) =  (TmInt (n + m),env,k,tenv) 

-- Evaluation rules for projections 
eval1 ((TmFst (TmPair v w)),env,k,tenv)  =  (TmPair v w,env, FstH : k,tenv) 
                        

eval1 ((TmSnd (TmPair v w)),env,k,tenv) = (TmPair v w,env, SndH : k,tenv) 
eval1 ((TmPair v w),env, FstH:k,tenv) | isValue v && isValue w = ( v , [] , k,tenv)
eval1 ((TmPair v w),env, SndH:k,tenv) | isValue v && isValue w = ( w , [] , k,tenv) 

-- Evaluation rules for pairs
eval1 ((TmPair e1 e2),env,k,tenv) = (e1,env,(HPair e2 env):k,tenv)
eval1 (v,env1,(HPair e env2):k,tenv) | isValue v = (e,env2,(PairH v) : k,tenv)
eval1 (w,env,(PairH v):k,tenv) | isValue w = ( (TmPair v w),[],k,tenv) 

-- Evaluation rules for if-then-else (could make the type constraint that e2 has to equal e3)

--evaluate variables first 
eval1((TmIf (TmVar x) e2 e3),env,k,tenv) = (TmVar x,env,(HIf e2 e3 env):k,tenv) 
eval1(v,env1,(HIf e2 e3 env2):k,tenv) | not ((typeOf tenv v) == TyBool) = (TmIf v e2 e3,env2,k,tenv)

--implicit casting converting ints to bools. 
eval1 ((TmIf (TmInt 1) e2 e3),env,k,tenv) = ((TmIf (TmTrue) e2 e3),env,k,tenv)
eval1 ((TmIf (TmInt 0) e2 e3),env,k,tenv) = ((TmIf (TmFalse) e2 e3),env,k,tenv)

eval1 ((TmIf e1 e2 e3),env,k,tenv) | TyBool == typeOf tenv e1 = (e1,env,(HIf e2 e3 env):k,tenv) 
                                   | otherwise = error "conditional expression must be boolean"
eval1 (TmTrue,env1,(HIf e2 e3 env2):k,tenv) = (e2,env2,k,tenv)
eval1 (TmFalse,env1,(HIf e2 e3 env2):k,tenv) = (e3,env2,k,tenv) 

-- Evaluation rules for Let blocks -- need to enforce type rules for variable storage. 

--converting between bools and ints. 
eval1((TmLet x (TyBool) (TmInt 0) e2),env,k,tenv) = eval1((TmLet x (TyBool) (TmFalse) e2),env,k,tenv)
eval1((TmLet x (TyBool) (TmInt 1) e2),env,k,tenv) = eval1((TmLet x (TyBool) (TmTrue) e2),env,k,tenv)

eval1((TmLet x (TyInt) (TmFalse) e2),env,k,tenv) = eval1((TmLet x (TyInt) (TmInt 0) e2),env,k,tenv)
eval1((TmLet x (TyInt) (TmTrue) e2),env,k,tenv) = eval1((TmLet x (TyInt) (TmInt 1) e2),env,k,tenv)



eval1 ((TmLet x typ e1 e2),env,k,tenv) | (typeOf tenv e1 == typ) = (e1,env,(HLet x typ e2 env):k,tenv) 
                                       | otherwise = error " Type Error: assignment type mismatch"
eval1 (v,env1,(HLet x typ e env2):k,tenv) | isValue v = (e, update env2 x v , k,addBinding x typ tenv) 

--  Rule to make closures from lambda abstractions.
eval1 ((TmLambda x typ e),env,k,tenv) =  ((Cl x typ e env), [], k,addBinding x typ tenv) 
                                  
-- Evaluation rules for application
eval1 ((TmApp e1 e2),env,k,tenv) = (e1,env, (HApp e2 env) : k,tenv) 
eval1 (v,env1,(HApp e env2):k,tenv ) | isValue v = (e, env2, (AppH v) : k,tenv)

--converting variable values between bool and int. 
eval1(TmInt 0, env1, (AppH (Cl x TyBool e env2) ) : k ,tenv) = (TmFalse, env1, (AppH (Cl x TyBool e env2) ) : k ,tenv)
eval1(TmInt 1, env1, (AppH (Cl x TyBool e env2) ) : k ,tenv) = (TmTrue, env1, (AppH (Cl x TyBool e env2) ) : k ,tenv)
eval1(TmTrue, env1, (AppH (Cl x TyInt e env2) ) : k ,tenv) = (TmInt 1, env1, (AppH (Cl x TyInt e env2) ) : k ,tenv)
eval1(TmFalse, env1, (AppH (Cl x TyInt e env2) ) : k ,tenv) = (TmInt 0, env1, (AppH (Cl x TyInt e env2) ) : k ,tenv)

eval1 (v,env1,(AppH (Cl x typ e env2) ) : k ,tenv)| typeOf tenv v == typ   = (e, update env2 x v, k,tenv) 
                                                  | otherwise = error "type of parameter value does not match"


-- Rule for runtime errors
eval1 (e,env,k,tenv) = error "Evaluation Error"

-- Function to iterate the small step reduction to termination
evalLoop :: Expr -> (Expr,ToyType )
evalLoop e = evalLoop' (e,[],[],[]) 
  where evalLoop' (e,env,k,tenv) = if (e' == e) && (isValue e') && (null k) then (e',typeOf tenv' e') else evalLoop' (e',env',k',tenv')
                       where (e',env',k',tenv') = eval1 (e,env,k,tenv) 

-- Function to unparse underlying values from the AST term
unparse :: Expr -> String 
unparse (TmInt n) = show n
unparse (TmTrue) = "true"
unparse (TmFalse) = "false"
unparse (TmUnit) = "()"
unparse (TmPair e1 e2) = "( " ++ (unparse e1) ++ " , " ++ (unparse e2) ++ " )"
unparse (Cl _ _ _ _) = "Function Value"
unparse _ = "Unknown"
