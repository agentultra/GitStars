module GitStars.Cli where

import Data.Attoparsec.Text
import Data.Text (pack)
import Protolude

putTextStr :: Text -> IO ()
putTextStr = putStr . encodeUtf8

parseInt :: Text -> Either Text Integer
parseInt input = (first pack) $ parseOnly (signed decimal) $ input
