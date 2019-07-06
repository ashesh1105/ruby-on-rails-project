require 'rails_helper'

# RSpec.describe User, type: :model do

#   context 'validation tests' do

#     it 'ensures username presence' do
#       user = User.create!(email: 'tannu1@example.com', password: 'password')
#       expect (user.valid?).to be true
#     end
#     it 'ensures email presence' do
#       user = User.create!(username: 'tanvi1', password: 'password')
#       expect (user.valid?).to eq(true)
#     end
#     it 'ensures password presence' do
#       user = User.create!(username: 'tanvi1', email: 'tannu1@example.com')
#       expect (user.valid?).to eq(true)
#     end
#     it 'should save new user successfully' do
#       user = User.create!(username: 'tanvi1', email: 'tannu1@example.com', password: 'password')
#       expect (user.valid?).to eq(false)
#       user.destroy
#     end
#   end

#   context 'scope tests' do
#   end
# end
