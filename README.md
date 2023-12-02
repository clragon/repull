# Repull

Repull automatically pulls and deploys releases from GitHub.

## Usage

Repull requires a `repull.yaml` config file:

```yaml
sources:
  - repo: user/repo
    deploy: |
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

You may additionally specify one or multiple regex patterns (one per line) to match against the release tag:

```yaml
sources:
  - repo: # ...
    regex: |
      .*_windows.*
      .*_linux.*
```

## Args

You may specify a custom config file path with the `-c` flag:

```bash
repull -c /somewhere/else/my_config.yaml
```

You may also ignore the current lock and run a one-time pull with the `-n` flag:

```bash
repull -n
```
