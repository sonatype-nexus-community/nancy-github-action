<p align="center">
    <img src="https://github.com/sonatype-nexus-community/nancy/blob/master/docs/images/nancy.png" width="350"/>
</p>

<p align="center">
    <a href="https://gitter.im/sonatype-nexus-community/nancy?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge"><img src="https://badges.gitter.im/sonatype-nexus-community/nancy.svg" alt="Gitter"></img></a>
</p>

# Nancy for GitHub Actions

Run [Sonatype Nancy](https://github.com/sonatype-nexus-community/nancy) as part of your GitHub Actions workflow.

## Inputs

### `target`

**Required** This is the path to the go.sum or Gopkg.lock file.

## Example Usage

```
name: Go Nancy

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Nancy
      uses: sonatype-nexus-community/nancy-github-action@master
      with:
        target: go.sum
```

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

* Use this contribution at the risk tolerance that you have
* Do NOT file Sonatype support tickets related to `Nancy for GitHub Actions` support in regard to this project
* DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using Nancy for GitHub Actions, we are glad to have you here!

## Getting help

Looking to contribute to our code but need some help? There's a few ways to get information:

* Chat with us on [Gitter](https://gitter.im/sonatype-nexus-community/nancy)
