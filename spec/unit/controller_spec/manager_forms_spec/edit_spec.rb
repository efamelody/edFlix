require "rspec"
require "rack/test"

require_relative '../../../../app'
require_relative '../../../../controllers/manager_forms_controllers/edit'

RSpec.describe "edit.rb controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /edit" do
    it "has a status code of 200 (OK)" do
      get "/edit"
      expect(last_response.status).to eq(200)
    end
  end

  describe "When saving" do
    it "has a status code of 200 (OK)" do
      post "/edit"
      expect(last_response.status).to eq(200)
    end
  end

end