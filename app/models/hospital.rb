class Hospital < ActiveRecord::Base
  attr_accessible :name, :city , :creation_date , :description
end
