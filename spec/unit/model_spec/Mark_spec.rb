require "rspec"
require "rack/test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative '../../../models/Mark'

RSpec.describe "Mark model" do
    include Rack::Test::Methods
    args_normal = [1,1,1,100.0,1,2]
    args_empty = Array.new(args_normal.length)
    test_mark = Mark.new()

    def expect_args(test, ords, args, catch_nil=true)

      #loads null values into new args array
      new_args = Array.new(args.length() -1)
      for i in (0...args.length) do
        if ords.include?(i)
          new_args[i] = args[i]
        else
          new_args[i] = nil
        end
      end
      #the method being tested
      test.load(new_args[0],new_args[1],new_args[2],new_args[3],new_args[4])
  
      vals = [test.id,
              test.userID,
              test.courseID,
              test.percentage,
              test.attempt]
      #expects all specified values to match args
      #doesn't check other values if catch_nil is specified false
      for i in (0...vals.length) do
        expect (vals[i]).to eq(new_args[i]) unless !catch_nil && new_args[i] == nil
      end
      #checking the new_args element value is faster than running include again
  end

    

    describe "When given blank parameters to load" do
        it "has blank attributes" do
          expect_args(test_mark,[],args_empty)
        end
    end

    describe "When given valid parameters to load" do
        it "loads successfully" do
            expect_args(test_mark,[0,1,2,3,4], args_normal)
        end
    end

    describe "When given invalid/incomplete parameters to load" do
        it "raises an error for id" do
          t_mark = Mark.new()
          expect(t_mark.validate).should raise_error
        end
    
        it "raises an error for userID" do
          expect_args(test_mark,[0], args_normal)
          expect(t_mark.validate).should raise_error
        end

        it "raises an error for courseID" do
          expect_args(test_mark,[0,1], args_normal)
          expect(t_mark.validate).should raise_error
        end
        
    
        it "raises an error for percentage" do
          expect_args(test_mark,[0,1,2], args_normal)
          expect(t_mark.validate).should raise_error
        end

        it "raises an error for pass" do
          expect_args(test_mark,[0,1,2,3], args_normal)
          expect(t_mark.validate).should raise_error
        end

        it "raises an error for attempt" do
          expect_args(test_mark,[0,1,2,3,4], args_normal)
          expect(t_mark.validate).should raise_error
        end
    end
end