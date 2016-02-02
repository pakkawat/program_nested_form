class ChefResource < ActiveRecord::Base
  has_many :program_chefs, dependent: :destroy
  has_many :programs, through: :program_chefs
end
