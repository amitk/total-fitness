require 'rails_helper'

resource 'Users' do
  get '/api/v1/users' do
    example 'listing users' do
      do_request
      expect(status).to eq 200
    end
  end
end
