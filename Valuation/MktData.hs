{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS_GHC -XFlexibleInstances #-}


--------------------------------------------------------------------------
--------------------------------- Module ---------------------------------
--------------------------------------------------------------------------
module Valuation.MktData  
    ( 
     MktData (..)
    ) where

--------------------------------------------------------------------------
------------------------------- Imports ----------------------------------
--------------------------------------------------------------------------
import Data.Time.Calendar
import qualified Data.Map as Map 
import Utils.MyJSON
import Utils.Containers
--------------------------------------------------------------------------
-------------------------------- Alias -----------------------------------
--------------------------------------------------------------------------
type DFCurve = Container1D' Day
type CFVol   = Container2D' Day Double
type SwptVol = Container3D' Day Double Int
--------------------------------------------------------------------------
------------------------------- Data -------------------------------------
--------------------------------------------------------------------------
data MktData = MktData {
                           mktDataCurves      :: Map.Map String DFCurve, 
                           mktDataVolCapFloor :: Maybe (Map.Map String CFVol),
                           mktDataVolSwaption :: Maybe (Map.Map String SwptVol)
                       } 


