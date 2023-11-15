require "sequel"
require "logger"
class Comment < Sequel::Model

    def load(params)
        self.id = params.fetch("id", "").strip 
        self.courseID= params.fetch("courseID", "").strip
        self.userID = params.fetch("userID", "").strip 
        self.stars = params.fetch("stars", "").strip 
        self.comment = params.fetch("comment", "").strip 
    end
end
