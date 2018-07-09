module GitStars.Github.Internal where

import Data.CaseInsensitive (CI)
import Protolude

userAgent :: (CI ByteString, ByteString)
userAgent = ("User-Agent" :: CI ByteString, "Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405")
