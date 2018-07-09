module GitStars.Render where

import           Control.Lens
import qualified Data.Text as T
import           GitStars.Github.Types
import           Protolude

showRepositoryList :: [Repository] -> IO ()
showRepositoryList repos = do
  putText (T.intercalate "\n" (rows repos))
  where
    rows = map renderRepo
    renderRepo :: Repository -> Text
    renderRepo repo = "Name: " <> (_repositoryName repo)
