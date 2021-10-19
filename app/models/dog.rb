class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :images

  def owner
    User.find_by(id: user_id)
  end
end
