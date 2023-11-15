require "rspec"
require "rack/test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative '../../../controllers/learner_forms_controller'

RSpec.describe "learner_forms_controller" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /process-learner-form" do
    it "has a status code of 200 (OK)" do
      get "/process-learner-form"
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET /learner-form" do
    it "has a status code of 200 (OK)" do
      get "/learner-form", "id" => 1, "course" => "computer_science", "yeargroup" => 1
      expect(last_response.status).to eq(200)
    end
  end

end