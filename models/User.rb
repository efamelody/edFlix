require "sequel"
require "logger"
class User < Sequel::Model


    def self.id_exists?(id)
        return false if id.nil? # check the id is not nil
        return false unless Validation.str_is_integer?(id) # check the id is an integer
        return false if User[id].nil? # check the database has a record with this id

        true
    end
    
    def load(params)
        self.username = params.fetch("username", "").strip 
        self.passwordHash = params.fetch("passwordHash", "").strip
        self.fullName = params.fetch("fullName", "").strip 
        self.role = params.fetch("role", "").strip 
        self.admin = params.fetch("admin", "").strip.to_s 
        self.degree = params.fetch("degree", "").strip 
        self.institutionCode = params.fetch("institutionCode", "").strip.to_s
        self.suspended = params.fetch("suspended", "").strip.to_s
        self.reason = params.fetch("reason", "").strip 
        self.email = params.fetch("email", "").strip  
    end

    
    def validate
        super
        errors.add("username", "cannot be empty") if !username || username.empty?
        errors.add("passwordHash", "cannot be empty") if !passwordHash || passwordHash.empty?
        errors.add("email", "cannot be empty") if !email || email.empty?

    end

end
