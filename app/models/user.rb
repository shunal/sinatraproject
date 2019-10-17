class User < ActiveRecord::Base
    has_many :instruments
    has_secure_password
end
