### mirage-websocket -- Websocket implementation for MirageOS

This is a work in progress built on top of `ocaml-websocket` and `mirage-http`.

### Httpaf

It doesn't work on upstream httpaf, it needs features that are pending for review:
- Mirage adapter (https://github.com/inhabitedtype/httpaf/pull/83)
- Upgrade connection (https://github.com/inhabitedtype/httpaf/pull/91)

### Examples

You can take a look in `test/` for a sample of websocket server.
