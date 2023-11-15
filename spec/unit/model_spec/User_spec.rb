require "rspec"
require "rack/test"

$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative '../../../models/User'

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
  test = User.new()
  #the method being tested
  test.load(new_args[0],new_args[1],new_args[2],new_args[3],new_args[4],new_args[5],new_args[6],new_args[7],new_args[8],new_args[9],new_args[10])

  vals = [test.id,
          test.username,
          test.passwordHash,
          test.email,
          test.fullName,
          test.degree,
          test.institutionCode,
          test.suspended,
          test.reason]
  #expects all specified values to match args
  #doesn't check other values if catch_nil is specified false
  for i in (0...vals.length) do
    expect (vals[i]).to eq(new_args[i]) unless !catch_nil && new_args[i] == nil
  end
  #checking the new_args element value is faster than running include again
end

RSpec.describe "User model" do
  include Rack::Test::Methods
  #FIX: may need to be replaced with underscores etc.
  #FIX: reorder arguments once refactoring is done
  args_normal = [1,"valid_name","val1dpa55w0rdHa5h","test@sheffield.ac.uk","Test User","biology","S18SHEFD",1,"plagiarism"]
  args_empty = Array.new(args_normal.length)
  

  describe "When given valid (full) parameters to load" do
    it "successfully loads" do
      test_user = User.new()
      test_user.load args_normal
      #expect_args([0,1,2,3,4,5,6,7,8,9,10],args_normal)
      expect(test_user.id).to eq(args[0])
      expect(test_user.username).to eq(args[1])
      expect(test_user.passwordHash).to eq(args[2])
      expect(test_user.email).to eq(args[3])
      expect(test_user.fullName).to eq(args[4])
      expect(test_user.role).to eq(args[5])
      expect(test_user.admin).to eq(args[6])
      expect(test_user.degree).to eq(args[7])
      expect(test_user.institutionCode).to eq(args[8])
      expect(test_user.suspended).to eq(args[9])
      expect(test_user.reason).to eq(args[10])
    end
  end

  describe "When given valid (initial) parameters to load" do
    it "successfully loads" do
      #test_user = User.new()
      #test_user.load(nil,args[1],args[2],args[3])
      expect_args([1,2,3],args_normal)
      #expect(test_user.id).to eq(nil)
      #expect(test_user.username).to eq(args[1])
      #expect(test_user.passwordHash).to eq(args[2])
      #expect(test_user.email).to eq(args[3])
      #expect(test_user.fullName).to eq(nil)
      #expect(test_user.role).to eq(nil)
      #expect(test_user.admin).to eq(nil)
      #expect(test_user.degree).to eq(nil)
      #expect(test_user.institutionCode).to eq(nil)
      #expect(test_user.suspended).to eq(nil)
      #expect(test_user.reason).to eq(nil)
    end
  end


  describe "When given no parameters to load" do
    it "has blank attributes" do
      #test_user = User.new()
      #test_user.load(nil,nil,nil,nil,nil,nil,nil,nil,nil,nil)#empty parameters
      #expect(test_user.id).to be_nil
      #expect(test_user.username).to be_nil
      #expect(test_user.passwordHash).to be_nil
      #expect(test_user.email).to be_nil
      #expect(test_user.fullName).to be_nil
      #expect(test_user.role).to be_nil
      #expect(test_user.admin).to be_nil
      #expect(test_user.degree).to be_nil
      #expect(test_user.institutionCode).to be_nil
      #expect(test_user.suspended).to be_nil
      #expect(test_user.reason).to be_nil
      expect_args([],args_empty)
    end

  end

  describe "When given invalid/incomplete parameters to load" do

    it "raises an error for username" do
      expect_args([0],args_normal,false)
      expect(test_user.validate).should raise_error()#FIX: check for specific errors
    end

    it "raises an error for passwordHash" do
      expect_args([0,1],args_normal,false)
      expect(test_user.validate).should raise_error()
    end
    
    it "raises an error for email" do
      expect_args(0,1,2,args_normal,false)
      expect(test_user.validate).should raise_error()
    end

  end


end

