class User < ApplicationRecord
  has_many :posts, inverse_of: :user, dependent: :destroy
end
