# Redirect

[![CI](https://github.com/ryanwinchester/redirect_plug_app/actions/workflows/ci.yml/badge.svg)](https://github.com/ryanwinchester/redirect_plug_app/actions/workflows/ci.yml)

Plug-based Elixir application that redirects every request.

Required ENV vars for prod:

 * `REDIRECT_HOST` - required (e.g. `"google.com"`)

Optional ENV vars:

 * `ENDPOINT_PORT` - defaults to `"443"`
 * `ENDPOINT_SCHEME` - defaults to `"https"`
 * `REDIRECT_PORT` - defaults to `"443"`
 * `REDIRECT_SCHEME` - defaults to `"https"`
 * `REDIRECT_STATUS` - defaults to `"302"` (e.g. `"301"`)

### Deploying to Fly

Change `fly.toml` to suit. Make special note of changing up `app` parameter.

Set env vars, e.g. (change from google to whatever):

```
fly secrets set REDIRECT_HOST=google.com
```
