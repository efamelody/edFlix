require "rspec"
require "rack/test"

#require_relative '../../../app'
require_relative '../../../controllers/legal'

RSpec.describe "legal.rb controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /search" do
    it "has a status code of 200 (OK)" do
      get "/search"
      expect(last_response.status).to eq(200)
    end
  end
end