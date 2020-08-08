require 'rails_helper'

RSpec.describe 'Dealers', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get dealers_path
      expect(response).to have_http_status(:success)
    end
  end
end
