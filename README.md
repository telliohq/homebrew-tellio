# homebrew-tellio

Homebrew tap for [Tellio](https://tellio.dev), an owner-controlled peer-to-peer folder
sync CLI.

```sh
brew tap telliohq/tellio
brew trust telliohq/tellio
brew install tellio
brew services start tellio
```

The tap name is `telliohq/tellio`; the formula name is `tellio`. Homebrew's fully
qualified form is `<owner>/<tap>/<formula>`, so the one-line equivalent is:

```sh
brew install telliohq/tellio/tellio
```

Homebrew 6 requires explicit trust for third-party taps. `brew trust telliohq/tellio`
trusts this single-formula tap; if you prefer item-level trust, use
`brew trust --formula telliohq/tellio/tellio` first.

The formula installs the unsigned prototype binaries from the GitHub release assets.
`tellio service` uses a per-user LaunchAgent; `brew services` uses Homebrew's service
manager. Use one, not both.
