{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -XFlexibleInstances #-}


--------------------------------------------------------------------------
--------------------------------- Module ---------------------------------
--------------------------------------------------------------------------
module Valuation
    ( 
     Valuable, value, valueGreeks,
     AnalyticValuable, valueA, valueAGreeks,
     Engine (..), ValueStorage (..)
    ) where

--------------------------------------------------------------------------
------------------------------- Imports ----------------------------------
--------------------------------------------------------------------------
import Utils.MyJSON
import Utils.MyUtils
import Valuation.MktData  
--------------------------------------------------------------------------
------------------------------- Classes ----------------------------------
--------------------------------------------------------------------------

class Valuable a where
    value       :: MktData -> a -> Result_ ValueStorage
    valueGreeks :: MktData -> a -> Result_ ValueStorage
--------------------------------------------------------------------------

class AnalyticValuable a where
    valueA       :: MktData -> a -> Result_ ValueStorage
    valueAGreeks :: MktData -> a -> Result_ ValueStorage
--------------------------------------------------------------------------
-------------------------------- Alias -----------------------------------
--------------------------------------------------------------------------

--------------------------------------------------------------------------
------------------------------- Data -------------------------------------
--------------------------------------------------------------------------
data Engine = Analytical | MonteCarlo | Tree | PDE
--------------------------------------------------------------------------
data ValueStorage = ValueStorage {
                                     vsValue :: Double, 
                                     vsSubValues :: [ValueStorage]
                                 } 
                  | ValueGreeksStorage {
                                           vgsValue :: Double, 
                                           vgsGreeks :: [Double], 
                                           vgsSubValues :: [ValueStorage]
                                       } deriving (Eq, Show, Data, Typeable)


