class ProgramChef < ActiveRecord::Base
  belongs_to :programs
  belongs_to :chef_resources
end
