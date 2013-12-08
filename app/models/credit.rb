class Credit < ActiveRecord::Base
  attr_accessible :credit, :user_id
  belongs_to :user
  def self.new_credit
    new {|u| u.credit = 0}
  end
end
