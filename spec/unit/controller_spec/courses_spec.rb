require "rspec"
require "rack/test"

require_relative "../../../controllers/course_controllers/biology"
require_relative "../../../controllers/course_controllers/computerscience"
require_relative "../../../controllers/course_controllers/math"

RSpec.describe "Course controllers" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET /" do
    it "has a status code of 200 (OK)" do
        get "/"
        expect(last_response.status).to eq(200)
    end
  end

  describe "GET /computerscience" do
    context "when redirected to computer science" do
        it "has a status code of 200 (OK)" do
          get "/computerscience"
          expect(last_response.status).to eq(200)
        end
    end
  end

  describe "GET /math" do
    context "when redirected to mathematics" do
        it "has a status code of 200 (OK)" do
          get "/math"
          expect(last_response.status).to eq(200)
        end
    end
  end

  describe "GET /admin/logout" do
    context "when redirected to biology" do
        it "has a status code of 200 (OK)" do
          get "/biology"
          expect(last_response.status).to eq(200)
        end
    end
  end
end