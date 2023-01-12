{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_algorithms (
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

bindir     = "/home/daiki/.cabal/bin"
libdir     = "/home/daiki/.cabal/lib/x86_64-linux-ghc-8.8.4/haskell-algorithms-0.1.0.0-inplace"
dynlibdir  = "/home/daiki/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/daiki/.cabal/share/x86_64-linux-ghc-8.8.4/haskell-algorithms-0.1.0.0"
libexecdir = "/home/daiki/.cabal/libexec/x86_64-linux-ghc-8.8.4/haskell-algorithms-0.1.0.0"
sysconfdir = "/home/daiki/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_algorithms_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_algorithms_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_algorithms_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_algorithms_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_algorithms_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_algorithms_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
