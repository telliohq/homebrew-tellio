# homebrew-tellio

Homebrew tap for [Tellio](https://tellio.dev), an owner-controlled peer-to-peer folder
sync CLI.

```sh
brew install telliohq/tellio/tellio
brew services start tellio
```

Homebrew 6 requires explicit trust for third-party taps. Installing the fully qualified
formula trusts just that formula; if your Homebrew asks for whole-tap trust instead:

```sh
brew tap telliohq/tellio
brew trust --formula telliohq/tellio/tellio
brew install telliohq/tellio/tellio
```

The formula installs the unsigned prototype binaries from the GitHub release assets.
`tellio service` uses a per-user LaunchAgent; `brew services` uses Homebrew's service
manager. Use one, not both.
