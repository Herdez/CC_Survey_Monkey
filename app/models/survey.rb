class Survey < ActiveRecord::Base
  # Remember to create a migration!
  has_many :records
  has_many :questions
  has_many :stats
  has_many :users, through: :records
  has_many :users, through: :stats
end
