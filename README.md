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

You may additionally specify one or multiple regex patterns (one per line) to match against the release asset names:

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

## Behaviour

Repull will run a loop for each repo in your config file.

When a network error is encountered, repull will continue its cycle as normal.
This is to prevent faulty network connections from halting the entire process.

If a deploy script fails (exit code != 0), repull will exit with the same exit code.
This is because we assume a failure in the deploy script means developer intervention is required.
If youre deploy script may fail but you wish to continue, please handle those failures in the deploy script.

## Logging

Repull logs to stdout and stderr.
All actions have comprehensive logs with timestamps, log levels, and source repo names.
