class DogSpec

  RSpec.feature 'Dog/User Association', type: :feature do
    scenario 'Dog can be created with an associated owner' do
      User.create(id: 1, name: 'Ava', password: '111111', email: 'a@a.a', created_at: Time.now, updated_at: Time.now)
      dog  = Dog.create(name: 'Vulpix', user_id: 1)
      expect(dog.owner.name).to eq('Ava')
    end

    scenario 'Dog can be created without an associated owner' do
      dog  = Dog.create(name: 'Lycanroc')
      expect(dog.owner).to be_nil
    end
  end
end