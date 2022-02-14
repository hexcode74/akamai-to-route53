# akamai to route53 - Migration tool from Akamai Edge DNS to Amazon Route 53

## Introduction

akamai-to-route53 tool provides export from Akamai Edge DNS and import to Route 53 domains.

Features:

- export BIND format from Akami Edge DNS
- create zone to Route 53 domains (if zone is not exist)
- import and replace to Route 53 domains

## Installation

To configure your Amazon credentials, either place them in a file `~/.aws/credentials`:
```
    [default]
    aws_access_key_id = AKID1234567890
    aws_secret_access_key = MY-SECRET-KEY
```

Or set the environment variables: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

The EdgeGrid plugin relies on an `~/.edgerc` credentials file that needs to be created in your home directory and organized by [section] following the format below. 
Each [section] can contain a different credentials set allowing you to store all of your credentials in a single `~/.edgerc` file.

```
    [default]
    client_secret = xxxx
    host = xxxx # Note, don't include the https:// here
    access_token = xxxx
    client_token = xxxx
    max-body = xxxx

    [section1]
    client_secret = xxxx
    host = xxxx # Note, don't include the https:// here
    access_token = xxxx
    client_token = xxxx
    max-body = xxxx
```


## Getting Started

Uses crontab to sync periodically.
	$ akamai-to-route53.sh


## Changelog
2021-08-26
* First Commit 
