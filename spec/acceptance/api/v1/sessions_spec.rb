require 'rails_helper'

resource 'session' do

  post 'api/v1/sessions' do
    let!(:user) { create(:user, email: 'amit@joshsoftware.com', password: '123456') };
    parameter :email, "User's email"
    parameter :password, "User's password"
    let(:params) {{
      user: {
        email: 'amit@joshsoftware.com',
        password: '123456',
      },
    }}
    example 'sign in user' do
      do_request(params)
      expect(status).to eq(200)
    end
  end
end
