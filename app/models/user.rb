class User < ActiveRecord::Base
  validates :father_name, :mother_name, presence: true
end
