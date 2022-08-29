# Redirect

Plug-based Elixir application that redirects every request.

ENV vars for prod:

 * `ENDPOINT_PORT` - defaults to `"443"`
 * `ENDPOINT_SCHEME` - defaults to `"https"`
 * `REDIRECT_HOST` - required (e.g. `"google.com"`)
 * `REDIRECT_PORT` - defaults to `"443"`
 * `REDIRECT_SCHEME` - defaults to `"https"`
 * `REDIRECT_STATUS` - defaults to `"302"` (e.g. `"301"`)
