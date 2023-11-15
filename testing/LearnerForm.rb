require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Validation and Sanitisation Example" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Form Submission" do
    it "says Success when the data is ok" do
      get "/LearnerForm", "ID" => "Some Text", "degree" => "Some Text", "year" => "Some Text", "courseLength" => "courseLength"
      expect(last_response.body).to include("Success!")
    end

    it "rejects the form when field1 is not filled out" do
      get "/LearnerForm", "ID" => "Some Text", "degree" => "Some Text", "year" => "Some Text"
      expect(last_response.body).to include("Please correct the errors below")
      expect(last_response.body).to include("Please fill in the course length")
    end

    it "rejects the form when field1 is not filled out" do
      get "/LearnerForm", "ID" => "Some Text", "degree" => "Some Text" , "courseLength" => "courseLength" 
      expect(last_response.body).to include("Please correct the errors below")
      expect(last_response.body).to include("Please fill in the year")
    end

    it "rejects the form when degree is not filled out" do
      get "/LearnerForm", "ID" => "Some Text", "year" => "Some Text", "courseLength" => "courseLength" 
      expect(last_response.body).to include("Please correct the errors below")
      expect(last_response.body).to include("Please fill in your degree")
    end  
  end
end