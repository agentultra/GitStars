module Main where

import qualified GitStars as G
import           Protolude

main :: IO ()
main = do
  G.putTextStr "Enter a username: "
  userName <- getLine
  G.putTextStr "How many repositories? "
  limit <- liftIO $ getLine
  let limit' = either (const 5) identity $ G.parseInt limit
  starred <- G.userStars userName limit'
  case starred of
    Left err           -> putText ("Error retrieving results: "
                                  <> (G.getErrMsg err))
    Right repositories -> G.showRepositoryList repositories
