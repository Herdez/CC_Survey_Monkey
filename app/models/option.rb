class Option < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :stats
  has_many :options_answered, :foreign_key => :choice, :class_name => "Stat"
  has_many :users, through: :stats
end
