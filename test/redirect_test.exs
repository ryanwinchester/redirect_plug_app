defmodule RedirectTest do
  use ExUnit.Case, async: true

  describe "without following redirects" do
    test "to new host" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4001
      }

      expected = "https://google.com"

      assert resp = Req.get!(uri, follow_redirects: false)
      assert resp.status == 302
      assert resp.body =~ "You are being redirected to google.com..."
      assert {"location", expected} in resp.headers
    end

    test "with params" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4001,
        query: "q=foo+fighters"
      }

      expected = "https://google.com?#{uri.query}"

      assert resp = Req.get!(uri, follow_redirects: false)
      assert resp.status == 302
      assert resp.body =~ "You are being redirected to google.com..."
      assert {"location", expected} in resp.headers
    end

    test "with path" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4001,
        path: "/search"
      }

      expected = "https://google.com/search"

      assert resp = Req.get!(uri, follow_redirects: false)
      assert resp.status == 302
      assert resp.body =~ "You are being redirected to google.com..."
      assert {"location", expected} in resp.headers
    end

    test "with path and query params" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4001,
        query: "q=foo+fighters",
        path: "/search"
      }

      expected = "https://google.com#{uri.path}?#{uri.query}"

      assert resp = Req.get!(uri, follow_redirects: false)
      assert resp.status == 302
      assert resp.body =~ "You are being redirected to google.com..."
      assert {"location", expected} in resp.headers
    end
  end
end
