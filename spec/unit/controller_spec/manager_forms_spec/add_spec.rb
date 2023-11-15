require "rspec"
require "rack/test"

require_relative '../../../../app'
require_relative '../../../../controllers/manager_forms_controllers/add'

RSpec.describe "add.rb controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /add" do
    it "has a status code of 200 (OK)" do
      get "/add"
      expect(last_response.status).to eq(200)
    end
  end

  describe "POST /add" do
    it "has a status code of 200 (OK)" do
      post "/add"
      expect(last_response.status).to eq(200)
    end
  end

  
    
end