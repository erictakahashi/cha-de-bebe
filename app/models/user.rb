class User < ActiveRecord::Base
  validates :father_name, presence: true
end
