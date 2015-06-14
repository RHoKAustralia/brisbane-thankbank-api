require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  before { request.headers['X-AUTH-TOKEN'] = IOS_TOKEN }

  describe 'POST create' do
    let(:user_params) do
      {
        fist_name:    'Test',
        last_name:    'User',
        facebook_uid: '123456'
      }
    end

    def action
      post :create, user: user_params
    end

    context 'valid params' do
      before { allow_any_instance_of(User).to receive(:valid?) { true } }

      context '' do
        before { action }
        it { expect(response).to have_http_status(:ok) }
        it { expect(response.body).to have_node(:user) }
      end

      it 'creates a new user' do
        expect{ action }.to change(User, :count).by(1)
      end
    end

    context 'invalid params' do
      before { allow_any_instance_of(User).to receive(:valid?) { false } }

      context '' do
        before { action }
        it { expect(response).to have_http_status(422) }
        it { expect(response.body).to have_node(:message) }
      end

      it 'does not create a new user' do
        expect{ action }.to change(User, :count).by(0)
      end
    end
  end
end
