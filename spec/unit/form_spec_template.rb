require "rspec"
require "rack/test"

require_relative "../../app"

RSpec.describe "Form test template" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Form Submission" do
    context "when data is valid" do
      it "says Success" do
        get "/form", "field1" => "Some Text", "field2" => "Some Text"
        expect(last_response.body).to include("Success!")
      end
    end

    context "when field1 is not filled out" do
      it "rejects the form" do
        get "/form", "field2" => "Some Text"
        expect(last_response.body).to include("Please correct the errors below")
        expect(last_response.body).to include("Please enter a value for field 1")
      end
    end

    context "when field1 is not filled out" do
      it "rejects the form" do
        get "/form", "field1" => "Some Text"
        expect(last_response.body).to include("Please correct the errors below")
        expect(last_response.body).to include("Please enter a value for field 2")
      end
    end

    context "when no fields are filled"
      it "displays both errors when neither field is filled out" do
        get "/form"
        expect(last_response.body).to include("Please correct the errors below")
        expect(last_response.body).to include("Please enter a value for field 1")
        expect(last_response.body).to include("Please enter a value for field 2")
      end
    end

  end