require "rails_helper"
require "rspec-html-matchers"

RSpec.describe "hello (static page)", type: :request do
  include RSpecHtmlMatchers

  describe "GET /pages/hello" do
    it "loads and has a link to hello page" do
      get page_path("hello")

      ap response
      expect(response).to have_http_status(200)
      show_in_browser(response.body)

      sleep 50
      expect(response.body).to(
        have_tag(:h1) do
          with_text "Hello World"
        end
      )
    end
  end
end
