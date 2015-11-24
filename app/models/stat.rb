class Stat < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :survey
  belongs_to :responder, class_name: "User"
end
