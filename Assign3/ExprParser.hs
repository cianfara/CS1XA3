{-|
Module : ExprParser
Description : Contains a type class and instances for
differentiable expressions
Copyright : (c) Adam Cianfarani @2018
License : CC0
Maintainer : cianfara@mcmaster.ca
Stability : experimental
Portability : POSIX

-}

module ExprParser (parseExprD,parseExprF) where

import           ExprType

import           Text.Parsec
import           Text.Parsec.String
import 			 ExprPretty

parseExprD :: String -> Expr Double
parseExprD ss = case parse exprD "" ss of
                  Left err   -> error $ show err
                  Right expr -> expr

parseExprF :: String -> Expr Float
parseExprF ss = case parse exprF "" ss of
                  Left err   -> error $ show err
                  Right expr -> expr

exprD :: Parser (Expr Double)
exprD = error "define me!" -- #TODO complete parser

exprF :: Parser (Expr Float)
exprF = error "define me!" -- #TODO complete parser
