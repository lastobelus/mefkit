require "rails_helper"

RSpec.describe "home (static page)", type: :request do
  include RSpecHtmlMatchers

  describe "GET /pages/home" do
    it "loads and has a link to hello page" do
      get '/'

      expect(response).to have_http_status(200)

      expect(response.body).to(
        have_tag(:a, with: { href: "/pages/hello" }) do
          with_text "Hello"
        end
      )
    end
  end
end
