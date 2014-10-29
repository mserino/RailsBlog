require 'rails_helper'

describe 'User' do
	it 'has a name' do
		jack = User.create(email: 'test@test.com', name: 'Jack', password: '1234567890', password_confirmation: '1234567890')
		expect(jack.name).to eq 'Jack'
	end
end