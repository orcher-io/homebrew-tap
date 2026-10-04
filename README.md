<p>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/orcher-io/homebrew-tap/main/assets/banner.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/orcher-io/homebrew-tap/main/assets/banner-light.svg">
    <img alt="ORCHER Homebrew tap" src="https://raw.githubusercontent.com/orcher-io/homebrew-tap/main/assets/banner.svg" width="100%">
  </picture>
</p>

<p align="center"><sub>Install the ORCHER command-line interface with Homebrew, on macOS and Linux.</sub></p>

<br />

<div>
  <a href="https://github.com/orcher-io/homebrew-tap/actions/workflows/test.yml"><img src="https://img.shields.io/github/actions/workflow/status/orcher-io/homebrew-tap/test.yml?branch=main&style=flat-square&labelColor=0a0a0a&color=04B385&logo=github&logoColor=white&label=formula" alt="Formula test"></a>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-Apache_2.0-38BDF0?style=flat-square&labelColor=0a0a0a" alt="Apache 2.0"></a>
</div>

<br />

### <img height="16" src="https://octicons-col.vercel.app/download/38BDF0"> Install

```bash
brew install orcher-io/tap/orcher
```

That adds this tap and installs `orcher`. Check it worked:

```bash
orcher --version
```

<br />

### <img height="16" src="https://octicons-col.vercel.app/sync/38BDF0"> Upgrade and uninstall

```bash
brew upgrade orcher
brew uninstall orcher
brew untap orcher-io/tap
```

<br />

### <img height="16" src="https://octicons-col.vercel.app/package/38BDF0"> What's in this tap

| Formula | What it installs |
|---------|------------------|
| [`orcher`](Formula/orcher.rb) | The [ORCHER CLI](https://github.com/orcher-io/cli): run a local engine, and start, watch and control workflows on any engine |

The formula installs the prebuilt binary from the CLI's
[GitHub release](https://github.com/orcher-io/cli/releases) for your platform
(Apple silicon or Intel on macOS, x86_64 or arm64 on Linux) and checks it
against the release's SHA-256. Each CLI release updates it here, so this
repository has no code of its own to change.

Not using Homebrew? The [CLI's README](https://github.com/orcher-io/cli#install)
lists the other ways to install it: a shell or PowerShell installer, Cargo,
pip and npm.

<br />

### <img height="16" src="https://octicons-col.vercel.app/issue-opened/38BDF0"> Problems

Report problems with installing or running `orcher` in
[orcher-io/cli](https://github.com/orcher-io/cli/issues), including ones that
only happen through Homebrew.

### <img height="16" src="https://octicons-col.vercel.app/law/38BDF0"> License

Licensed under the [Apache License, Version 2.0](LICENSE).
