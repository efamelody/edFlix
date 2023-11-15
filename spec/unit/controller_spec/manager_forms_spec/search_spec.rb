require "rspec"
require "rack/test"

require_relative '../../../../app'
require_relative '../../../../controllers/manager_forms_controllers/search'

RSpec.describe "search.rb controller" do
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

  #params need checking
  describe "When given 'course search' parameters" do
    it "has a status code of 200 (OK)" do
      params = {:degree => "course_search"}
      get "/search"
      expect(last_response.status).to eq(200)
    end
  end

  describe "When given standard search parameters" do
    it "has a status code of 200 (OK)" do
      params = {:degree => "computerscience"}
      get "/search"
      expect(last_response.status).to eq(200)
    end
  end
end