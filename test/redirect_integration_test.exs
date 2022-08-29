defmodule RedirectIntegrationTest do
  use ExUnit.Case, async: true

  describe "following redirects" do
    @tag :integration
    test "to new host" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4000
      }

      assert resp = Req.get!(uri)
      assert resp.status == 200
      assert resp.body =~ "Google Search"
    end

    @tag :integration
    test "with query params" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4000,
        query: "q=foo"
      }

      assert resp = Req.get!(uri)
      assert resp.status == 200
      assert resp.body =~ "foo"
      assert resp.body =~ "Google Search"
    end

    @tag :integration
    test "with path" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4000,
        path: "/search"
      }

      assert resp = Req.get!(uri)
      assert resp.status == 200
      assert resp.body =~ "Google Search"
    end

    @tag :integration
    test "with path and query params" do
      uri = %URI{
        scheme: "http",
        host: "localhost",
        port: 4000,
        query: "q=foo+fighters",
        path: "/search"
      }

      assert resp = Req.get!(uri)
      assert resp.status == 200
      assert resp.body =~ "Foo Fighters - Wikipedia"
    end
  end
end
