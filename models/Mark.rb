require "sequel"
require "logger"
class Mark < Sequel::Model

    def load(params)
        self.id = params.fetch("id", "").strip 
        self.userID = params.fetch("userID", "").strip
        self.courseID = params.fetch("courseID", "").strip 
        self.percentage = params.fetch("percentage", "").strip 
        self.attempt = params.fetch("attempt", "").strip 

    end
    
    def validate
        super
        errors.add("id", "cannot be empty") if !id || id.empty?
        errors.add("userID", "cannot be empty") if !userID || userID.empty?
        errors.add("courseID", "cannot be empty") if !courseID || courseID.empty?
        errors.add("percentage", "cannot be empty") if !percentage || percentage.empty?
        errors.add("attempt", "cannot be empty") if !attempt || attempt.empty?
    end
end
