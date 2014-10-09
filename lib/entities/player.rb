module RPS
	class Player < ActiveRecord::Base
  	
  	has_many :games

	  validates :username, uniqueness: true

    def self.encrypt_password(password)
      Digest::SHA2.hexdigest(password)
    end

    def validate_password(password)
      self.password_hash == Digest::SHA2.hexdigest(password)
    end
  
  end
end