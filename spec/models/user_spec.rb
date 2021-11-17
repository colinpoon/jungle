require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'Validations' do
      it 'Creates a new user if all validations are true' do
        @user = User.new(name: "hihi", email: "hihi@gmail.com", password: "123", password_confirmation: "123")
        @user.valid?
        expect(@user.errors.full_messages).not_to include("Field can't be blank")
      end

end
