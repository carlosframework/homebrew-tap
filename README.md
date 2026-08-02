# 🤖 carlosframework/homebrew-tap

Homebrew formulae for the CARLOS ecosystem's CLIs.

```
brew tap carlosframework/tap
brew install carlos       # the platform binary — edge, host agent, operator CLI
brew install rastrillo    # the CARLOS web framework CLI
```

- **`carlos`** installs a pre-built binary from
  [`carlosframework/releases`](https://github.com/carlosframework/releases)
  — its source repo (`carlosframework/platform`) is private, so this
  formula can't build from source; see that repo's README for why.
- **`rastrillo`** builds from source
  ([`carlosframework/rastrillo`](https://github.com/carlosframework/rastrillo),
  public) — standard for a Go CLI, `depends_on "go" => :build`.

No LICENSE has been published yet for either source repo — both
formulae omit the `license` field rather than assert one; `brew audit
--strict` will flag that until it's resolved upstream.
