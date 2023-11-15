require "rspec"
require "rack/test"

require_relative '../../../../app'
require_relative '../../../../controllers/manager_forms_controllers/course'

RSpec.describe "course.rb controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /courses" do
    it "has a status code of 200 (OK)" do
      get "/courses"
      expect(last_response.status).to eq(200)
    end
  end
  
    
end