require 'rails_helper'

RSpec.describe 'Userrails', type: :request do
  describe 'GET /userrails' do
    it 'works! (now write some real specs)' do
      get userrails_index_path
      expect(response).to have_http_status(200)
    end
  end
end
