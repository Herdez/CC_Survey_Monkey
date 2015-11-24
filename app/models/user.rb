class User < ActiveRecord::Base
  
  has_many :records
  has_many :surveys_answered, :foreign_key => :responder_id, :class_name => "Stat"
	validates :email, presence: true, uniqueness: true
	has_many :stats
	has_many :surveys, through: :records
  has_many :surveys, through: :stats
  has_many :options, through: :stats


	def self.autenticate(email, password)
		user = User.find_by(email:email)

		if user.password == password
			user
		else
			nil
		end
	end


end
