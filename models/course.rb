require "sequel"
require "logger"
class Course < Sequel::Model(:courses)
    plugin :validation_helpers
    
    
    

    def load(params)
        self.id = params.fetch("id", "").strip 
        self.name= params.fetch("name", "").strip
        self.description = params.fetch("description", "").strip 
        self.yeargroup = params.fetch("yeargroup", "").strip 
        self.degree = params.fetch("degree", "").strip 
        self.paid = params.fetch("paid", "").strip 
        self.certificate = params.fetch("certificate", "").strip 
    end
    
    def validate
        super
        validates_presence [:yeargroup], message: "is required"
        errors.add("id", "cannot be empty") if !id || id.to_s.empty?
        errors.add("name", "cannot be empty") if !name || name.empty?
        errors.add("description", "cannot be empty") if !description || description.empty?
        errors.add("yeargroup", "cannot be empty") if !yeargroup || yeargroup.empty?
        errors.add("degree", "cannot be empty") if !degree || degree.empty?
        errors.add("paid", "cannot be empty") if !paid || paid.empty?
        errors.add("certificate", "cannot be empty") if !certificate || certificate.empty?
    end
end
