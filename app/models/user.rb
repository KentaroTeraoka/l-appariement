class User < ApplicationRecord

  validates :name,{presence: true}
  validates :user_id,{uniqueness: true, presence: true}

end
