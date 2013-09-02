class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :name, :surname
end
