require "rspec"
require "rack/test"

$LOAD_PATH.unshift(File.dirname(__FILE__))#makes sure files are loaded for require_relative
require_relative "../../../models/Comment"
RSpec.describe "Comment model" do
    include Rack::Test::Methods
    args_normal = [1,1,1,3,"useful and engaging"] #FIX: might need to remove/reformat spaces
    args_empty = Array.new(args_normal.length)
    def expect_args(ords, args, catch_nil=true)

        #loads null values into new args array
        new_args = Array.new(args.length() -1)
        for i in (0...args.length) do
          if ords.include?(i)
            new_args[i] = args[i]
          else
            new_args[i] = nil
          end
        end
        test = Comment.new()
        #the method being tested
        test.load [new_args[0],new_args[1],new_args[2],new_args[3],new_args[4]]

        vals = [test.id,
                test.courseID,
                test.userID,
                test.stars,
                test.comment]
        #expects all specified values to match args
        #doesn't check other values if catch_nil is specified false
        for i in (0...vals.length) do
          expect (vals[i]).to eq(new_args[i]) unless !catch_nil && new_args[i] == nil
        end
        #checking the new_args element value is faster than running include again
    end

    describe "When given blank parameters to load" do
        it "has blank attributes" do
          expect_args([], args_normal)
        end
    end

    describe "When given valid parameters to load" do
        it "loads successfully" do
            expect_args([0,1,2,3,4], args_normal)
        end
    end

    describe "When given invalid/incomplete parameters to load" do
        it "raises the correct error for id" do
          test_comment = Comment.new()#no parameters/attributes
          expect(test_comment.validate).to raise_error
        end
    
        it "raises the correct error for courseID" do
          expect_args([0],args_normal, false)
          expect(test_comment.validate).to raise_error
        end
        
        it "raises the correct error for userID" do
          expect_args([0,1],args_normal, false)
          expect{test_comment.validate}.to raise_error
        end
    
        it "raises the correct error for stars" do
            expect_args([0,1,2], args_normal, false)
            expect{test_comment.validate}.to raise_error
        end

        it "raises the correct error for comment" do
            expect_args([0,1,2,3] ,args_normal, false)
            expect(test_comment.validate).to raise_error
        end
    end
end