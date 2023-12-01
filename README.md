# Repull

Repull automatically pulls and deploys releases from GitHub.

## Usage

Repull requires a `repull.yaml` config file:

```yaml
sources:
  - repo: user/repo
    deploy: |-
      unzip -o -d /var/www/html my_release.zip
```

You may specify as many sources as you want.
The `deploy` commands will be executed in the directory with your release assets.

You may also specify an optional interval in seconds to check for new releases:

```yaml
sources:
  - repo: # ...
      interval: 3600 # check every hour
```

The interval defaults to 24 hours.
