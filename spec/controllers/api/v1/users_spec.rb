require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a list of users' do
      create_list(:user, 3)
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).length).not_to eq(0)
    end
  end

  describe 'POST #create' do
    it 'creates a new user' do
      role = create(:role)
      user_params = attributes_for(:user, role_id: role.id)
      post :create, params: { user: user_params }
      expect(response).to have_http_status(:created)
      expect(User.count).not_to eq(0)
    end

    it 'returns errors for invalid user' do
      post :create, params: { user: { email: 'invalid_email' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing user' do
      user = create(:user)
      new_email = 'new_email@example.com'
      put :update, params: { id: user.id, user: { email: new_email } }
      expect(response).to have_http_status(:success)
      user.reload
      expect(user.email).to eq(new_email)
    end

    it 'returns errors for invalid update' do
      user = create(:user)
      put :update, params: { id: user.id, user: { email: 'invalid_email' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  
  describe 'DELETE #delete' do
    it 'deletes an existing user' do
      user = create(:user)
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
