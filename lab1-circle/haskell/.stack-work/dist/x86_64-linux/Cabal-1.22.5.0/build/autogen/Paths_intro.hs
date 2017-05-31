module Paths_intro (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/mik/aston/modules/plcS1617/base/01_intro/lab1-circle/haskell/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/bin"
libdir     = "/home/mik/aston/modules/plcS1617/base/01_intro/lab1-circle/haskell/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/lib/x86_64-linux-ghc-7.10.3/intro-0.1.0.0-ErcahJ0ZxptH9a71aKofvn"
datadir    = "/home/mik/aston/modules/plcS1617/base/01_intro/lab1-circle/haskell/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/share/x86_64-linux-ghc-7.10.3/intro-0.1.0.0"
libexecdir = "/home/mik/aston/modules/plcS1617/base/01_intro/lab1-circle/haskell/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/libexec"
sysconfdir = "/home/mik/aston/modules/plcS1617/base/01_intro/lab1-circle/haskell/.stack-work/install/x86_64-linux/lts-6.5/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "intro_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "intro_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "intro_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "intro_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "intro_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
