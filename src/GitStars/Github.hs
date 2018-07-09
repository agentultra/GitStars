module GitStars.Github
  ( GithubError (..)
  , Repository (..)
  , Owner (..)
  , License (..)
  , userStars
  ) where

import           Data.Aeson (eitherDecode)
import qualified Data.Text as T
import           GitStars.Github.Internal
import           GitStars.Github.Types
import           Network.HTTP.Client
import           Network.HTTP.Client.TLS
import           Protolude

type Username = Text
type Limit = Integer

newtype GithubError = GithubError { getErrMsg :: Text }
  deriving (Eq, Generic, Show)

userStars :: Username -> Limit -> IO (Either GithubError [Repository])
userStars username limit = do
  manager <- newManager tlsManagerSettings
  request <- parseRequest $ T.unpack $ "https://api.github.com/users/"
                            <> username
                            <> "/starred?per_page="
                            <> (show limit)
                            <> "&page=1"
  response <- liftIO $ httpLbs (request
                               { method = "GET"
                               , requestHeaders = [userAgent]
                               }) manager
  return $ packError $ eitherDecode $ responseBody response
  where
    packError = first $ GithubError . T.pack
