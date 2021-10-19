require 'rails_helper'

class DogSpec
  RSpec.describe Dog do
    # before(:each) { Dog.delete_all }

    it 'can be created with an associated owner' do
      User.create(id: 1, name: 'Ava', password: '111111', email: 'a@a.a', created_at: Time.now, updated_at: Time.now)
      dog  = Dog.create(name: 'Vulpix', user_id: 1)
      expect(dog.owner.name).to eq('Ava')
    end

    it 'can be created without an associated owner' do
      dog  = Dog.create(name: 'Lycanroc')
      expect(dog.owner).to be_nil
    end

    it 'can be found in paginated batches' do
      6.times { |i| Dog.create(name: 'dog' + i.to_s) }
      expect(Dog.page(0).count).to eq(5)
    end

    it 'has pagination that correctly uses offset' do
      6.times { |i| Dog.create(name: 'dog' + i.to_s) }
      expect(Dog.page(1).count).to eq(1)
    end

    it 'has pagination that does not fail for nonexistent pages' do
      6.times { |i| Dog.create(name: 'dog' + i.to_s) }
      expect(Dog.page(2).count).to eq(0)
    end
  end
end
