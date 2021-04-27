{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_ctest (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\ctest-0.1.0.0-inplace-ctest"
dynlibdir  = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1"
datadir    = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\ctest-0.1.0.0"
libexecdir = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\ctest-0.1.0.0-inplace-ctest\\x86_64-windows-ghc-9.0.1\\ctest-0.1.0.0"
sysconfdir = "C:\\Users\\subif\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ctest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ctest_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ctest_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ctest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ctest_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ctest_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
