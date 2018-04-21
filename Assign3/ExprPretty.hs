module ExprPretty where

import           ExprType

parens :: String -> String
parens ss = "(" ++ ss ++ ")"

instance Show a => Show (Expr a) where
  show (Mult e1 e2) = parens (show e1) ++ " !* " ++ parens (show e2)
  show (Add e1 e2)  = parens (show e1) ++ " !+ " ++ parens (show e2)
  show (Sub e1 e2)  = parens (show e1) ++ " !- " ++ parens (show e2)
  show (Div e1 e2)  = parens (show e1) ++ " !/ " ++ parens (show e2)
  show (Log e1 e2)  = "Log" ++ parens (show e1) ++ "to" ++ parens (show e2)
  show (Pow e1 e2)  = parens (show e1) ++ "^" ++ parens (show e2)
  show (Sin e1)  = "Sin" ++ parens (show e1)
  show (Cos e1)  = "Cos" ++ parens (show e1)
  show (Ln e1)  = "Ln" ++ parens (show e1)
  show (Exp e1)  = "e^" ++ parens (show e1)
  show (Const x)    = parens $ "val " ++ show x



