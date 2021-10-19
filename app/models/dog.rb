class Dog < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :images

  def owner
    User.find_by(id: user_id)
  end

  def owner_name
    name = owner.name unless name.nil?
    name ||= 'Unknown'
  end

  #consider making separate Dogs model to contain plural logic
  def self.page(page_number = 0)
    page_length = Rails.configuration.dogs_per_page
    offset = page_number * page_length
    Dog.limit(page_length).offset(offset)
  end
end
