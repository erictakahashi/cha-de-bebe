class User < ActiveRecord::Base
  validates :father_name, :mother_name, presence: true

  has_many :donations
end
