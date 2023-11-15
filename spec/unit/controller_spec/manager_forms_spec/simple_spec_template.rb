require "rspec"
require "rack/test"

require_relative "../../../controllers/course_controllers/tested"

RSpec.describe "Course controllers" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /tested" do
    it "has a status code of 200 (OK)" do
        get "/tested"
        expect(last_response.status).to eq(200)
    end
  end
end