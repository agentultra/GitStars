{-# LANGUAGE TemplateHaskell #-}

module GitStars.Github.Types where

import Control.Lens
import Data.Aeson
import Data.Aeson.Casing
import Data.Time (UTCTime)
import Protolude

data Owner =
  Owner
  { _ownerLogin             :: Text
  , _ownerId                :: Int
  , _ownerNodeId            :: Text
  , _ownerAvatarUrl         :: Text
  , _ownerGravatarId        :: Text
  , _ownerUrl               :: Text
  , _ownerHtmlUrl           :: Text
  , _ownerFollowersUrl      :: Text
  , _ownerFollowingUrl      :: Text
  , _ownerGistsUrl          :: Text
  , _ownerStarredUrl        :: Text
  , _ownerSubscriptionsUrl  :: Text
  , _ownerOrganizationsUrl  :: Text
  , _ownerReposUrl          :: Text
  , _ownerEventsUrl         :: Text
  , _ownerReceivedEventsUrl :: Text
  , _ownerType              :: Text
  , _ownerSiteAdmin         :: Bool
  }
  deriving (Eq, Generic, Show)

instance ToJSON Owner
instance FromJSON Owner where
  parseJSON = genericParseJSON $ aesonPrefix snakeCase

data License =
  License
  { _licenseKey    :: Text
  , _licenseName   :: Text
  , _licenseSpdxId :: Maybe Text
  , _licenseUrl    :: Maybe Text
  , _licenseNodeId :: Text
  }
  deriving (Eq, Generic, Show)

instance ToJSON License
instance FromJSON License where
  parseJSON = genericParseJSON $ aesonPrefix snakeCase

data Repository =
  Repository
  { _repositoryId               :: Int
  , _repositoryNodeId           :: Text
  , _repositoryName             :: Text
  , _repositoryFullName         :: Text
  , _repositoryOwner            :: Owner
  , _repositoryPrivate          :: Bool
  , _repositoryHtmlUrl          :: Text
  , _repositoryDescription      :: Maybe Text
  , _repositoryFork             :: Bool
  , _repositoryUrl              :: Text
  , _repositoryKeysUrl          :: Text
  , _repositoryCollaboratorsUrl :: Text
  , _repositoryTeamsUrl         :: Text
  , _repositoryHooksUrl         :: Text
  , _repositoryIssueEventsUrl   :: Text
  , _repositoryEventsUrl        :: Text
  , _repositoryAssigneesUrl     :: Text
  , _repositoryBranchesUrl      :: Text
  , _repositoryTagsUrl          :: Text
  , _repositoryBlobsUrl         :: Text
  , _repositoryGitTagsUrl       :: Text
  , _repositoryGitRefsUrl       :: Text
  , _repositoryTreesUrl         :: Text
  , _repositoryStatusesUrl      :: Text
  , _repositoryLanguagesUrl     :: Text
  , _repositoryStargazersUrl    :: Text
  , _repositoryContributorsUrl  :: Text
  , _repositorySubscribersUrl   :: Text
  , _repositorySubscriptionUrl  :: Text
  , _repositoryCommitsUrl       :: Text
  , _repositoryGitCommitsUrl    :: Text
  , _repositoryCommentsUrl      :: Text
  , _repositoryIssueCommentUrl  :: Text
  , _repositoryContentsUrl      :: Text
  , _repositoryCompareUrl       :: Text
  , _repositoryMergesUrl        :: Text
  , _repositoryArchiveUrl       :: Text
  , _repositoryDownloadsUrl     :: Text
  , _repositoryIssuesUrl        :: Text
  , _repositoryPullsUrl         :: Text
  , _repositoryMilestonesUrl    :: Text
  , _repositoryNotificationsUrl :: Text
  , _repositoryLabelsUrl        :: Text
  , _repositoryReleasesUrl      :: Text
  , _repositoryDeploymentsUrl   :: Text
  , _repositoryCreatedAt        :: UTCTime
  , _repositoryUpdatedAt        :: UTCTime
  , _repositoryPushedAt         :: UTCTime
  , _repositoryGitUrl           :: Text
  , _repositorySshUrl           :: Text
  , _repositoryCloneUrl         :: Text
  , _repositorySvnUrl           :: Text
  , _repositoryHomepage         :: Maybe Text
  , _repositorySize             :: Int
  , _repositoryStargazersCount  :: Int
  , _repositoryWatchersCount    :: Int
  , _repositoryLanguage         :: Text
  , _repositoryHasIssues        :: Bool
  , _repositoryHasProjects      :: Bool
  , _repositoryHasDownloads     :: Bool
  , _repositoryHasWiki          :: Bool
  , _repositoryHasPages         :: Bool
  , _repositoryForksCount       :: Int
  , _repositoryMirrorUrl        :: Maybe Text
  , _repositoryArchived         :: Bool
  , _repositoryOpenIssuesCount  :: Int
  , _repositoryLicense          :: Maybe License
  , _repositoryForks            :: Int
  , _repositoryOpenIssues       :: Int
  , _repositoryWatchers         :: Int
  , _repositoryDefaultBranch    :: Text
  }
  deriving (Eq, Generic, Show)

instance ToJSON Repository
instance FromJSON Repository where
  parseJSON = genericParseJSON $ aesonPrefix snakeCase

makeLenses ''Owner
makeLenses ''License
makeLenses ''Repository
