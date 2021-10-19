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
    page_number = 0 if page_number == nil
    page_length = Rails.configuration.dogs_per_page
    offset = page_number.to_i * page_length
    Dog.limit(page_length).offset(offset)
  end

  def self.max_page
    dogs_per_page = Rails.configuration.dogs_per_page
    (Dog.count / dogs_per_page.to_i) - 1 unless dogs_per_page.to_i == 0
  end
end
