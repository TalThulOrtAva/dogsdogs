require 'rails_helper'

describe 'Dog resource', type: :feature do
  before(:all) do
    user = User.find_by(id: 1)
    login_as(user)
  end

  it 'can create a profile' do
    visit new_dog_path
    fill_in 'Name', with: 'Speck'
    fill_in 'Description', with: 'Just a dog'
    attach_file 'dog_image', ['spec/fixtures/images/speck.jpg']
    click_button 'Create Dog'
    expect(Dog.count).to eq(1)
  end

  it 'can edit a dog profile' do
    dog = create(:dog)
    dog.user_id = 1
    dog.save
    visit edit_dog_path(dog)
    fill_in 'dog_name', with: 'Speck'
    click_button 'Update Dog'
    expect(dog.reload.name).to eq('Speck')
  end

  it 'can delete a dog profile' do
    dog = create(:dog)
    dog.user_id = 1
    dog.save
    visit dog_path(dog)
    click_link "Delete #{dog.name}'s Profile"
    expect(Dog.count).to eq(0)
  end
end
