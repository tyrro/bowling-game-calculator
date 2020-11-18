require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET #index' do
    describe 'JSON format' do
      render_views
      let(:roll_sequence) { 'XXXXXXXXXXXX' }

      it 'returns the list of courses in JSON' do
        get :index, params: { q: roll_sequence, format: :json }

        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          total_score: 300,
        )
      end
    end
  end
end
