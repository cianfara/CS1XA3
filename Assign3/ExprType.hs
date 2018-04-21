{-|
Module : ExprType
Description : Contains a type class and instances for
differentiable expressions
Copyright : (c) Adam Cianfarani @2018
License : CC0
Maintainer : cianfara@mcmaster.ca
Stability : experimental
Portability : POSIX

-}
module ExprType where

import           Data.List

data Expr a = Add (Expr a) (Expr a)  --Addition
            | Sub (Expr a) (Expr a)  --Subtraction
            | Mult (Expr a) (Expr a) --Multiplication
            | Div (Expr a) (Expr a)  --Division
            | Log (Expr a) (Expr a)  --Log to base a
            | Pow (Expr a) (Expr a)  --Functon Exponent
            | Sin (Expr a)           --Sine functon
            | Cos (Expr a)           --Cosine functon
            | Ln (Expr a)            --Nautural log
            | Exp (Expr a)           --e^Exponent
            | Const a                --Const value
            | Var String             --String
  deriving Eq


getVars :: Expr a -> [String]
getVars (Add e1 e2)  = getVars e1 ++ getVars e2
getVars (Sub e1 e2)  = getVars e1 ++ getVars e2
getVars (Mult e1 e2) = getVars e1 ++ getVars e2
getVars (Div e1 e2)  = getVars e1 ++ getVars e2
getVars (Log e1 e2)  = getVars e1 ++ getVars e2
getVars (Pow e1 e2)  = getVars e1 ++ getVars e2
getVars (Sin e)      = getVars e
getVars (Cos e)      = getVars e
getVars (Ln e)       = getVars e
getVars (Exp e)      = getVars e
getVars (Const _)    = []
getVars (Var ident)  = [ident]
