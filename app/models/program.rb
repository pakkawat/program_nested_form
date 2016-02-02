class Program < ActiveRecord::Base
  has_many :program_chefs, dependent: :destroy
  has_many :chef_resources, through: :program_chefs
end
