class Worker < ActiveRecord::Base
  belongs_to :user
  has_many :shares

  validates :username, :presence => true,
                       :uniqueness => {:case_sensitive => false}
end
