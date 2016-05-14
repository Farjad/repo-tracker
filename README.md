# repo-tracker
------------
DB will be added once it's final

### Usage

Environment variables
```ssh
export REPO_TRACKER_DB='repotracker'
export REPO_TRACKER_USER='repotracker'
export REPO_TRACKER_PASS='repotracker'
export REPO_TRACKER_HOST='localhost'
export REPO_TRACKER_PORT='5432'
```

Start service
```
thin -R config.ru start
```
