require 'rails_helper'

resource 'Users' do
  let!(:user) { create :user }
  get '/api/v1/users' do
    example 'listing users' do
      do_request
      expect(status).to eq 200
    end
  end

  get '/api/v1/users/:id' do
    parameter :id, 'user id'
    let(:id) { user.id }
    example 'get one user' do
      do_request
      expect(status).to eq(200)
    end
  end
end
