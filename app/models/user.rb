#load and use bcrypt engine
require 'bcrypt'
class User
  include Mongoid::Document
  
  #attr_accessors are the getters and setters, we need to get/set the password
  attr_accessor :password

  field :username,        type: String
  field :salt,            type: String
  field :hashed_password, type: String

  before_save :hash_stuff

  def authenticated?(pwd)
  	self.hashed_password == 
  	BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  private
  #hash the password
  def hash_stuff
  	#generate salt
  	self.salt = BCrypt::Engine.generate_salt
  	#hash it
  	self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
  	#get rid of the actual password, so set it to nil
  	self.password = nil
  end

end
