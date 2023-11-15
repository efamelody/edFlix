require "rspec"
require "rack/test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative '../../../models/course'


RSpec.describe "Course model" do
    include Rack::Test::Methods
    args_normal = [1,"biology","general biology course","yeargroup","degree","paid","certificate"] #FIX: might need to remove/reformat spaces
    args_empty = Array.new(args_normal.length)
    test_course = Course.new()
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
        test.load(new_args[0],new_args[1],new_args[2],new_args[3],new_args[4],new_args[5],new_args[6])
    
        vals = [test.id,
                test.name,
                test.description,
                test.yeargroup,
                test.degree,
                test.paid,
                test.certificate]
        #expects all specified values to match args
        #doesn't check other values if catch_nil is specified false
        for i in (0...vals.length) do
          expect (vals[i]).to eq(new_args[i]) unless !catch_nil && new_args[i] == nil
        end
        #checking the new_args element value is faster than running include again
    end

    describe "When given blank parameters to load" do
        it "has blank attributes" do
          expect_args(test_course,[],args_empty)
        end
        it "is not valid to load" do
          expect(test_course.validate).should raise_error
        end
    end

    describe "When given valid parameters to load" do
        it "loads successfully" do
            expect_args(test_course, [0,1,2,3,4,5,6], args_normal)
        end
    end

    describe "When given invalid/incomplete parameters to load" do
    
        it "raises an error for name" do
          expect_args(test_course,[0],args_normal, false)
          expect(test_user.validate).should raise_error
        end
        
        it "raises an error for description" do
          expect_args(test_course, [0,1], args_normal, false)
          expect(test_user.validate).should raise_error
        end
    
        it "raises an error for yeargroup" do
            expect_args(test_user, [0,1,2], args_normal, false)
            expect(test_user.validate).should raise_error
        end

        it "raises an error for degree" do
            expect_args(test_user, [0,1,2,3], args_normal, false)
            expect(test_user.validate).should raise_error
        end

        it "raises an error for paid" do
            expect_args(test_user, [0,1,2,3,4], args_normal, false)
            expect(test_user.validate).should raise_error
        end

        it "raises an error for certificate" do
            expect_args(test_user, [0,1,2,3,4,5], args_normal, false)
            expect(test_user.validate).should raise_error
        end

    end
end