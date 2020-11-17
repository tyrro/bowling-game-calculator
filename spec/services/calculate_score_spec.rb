require 'rails_helper'

RSpec.describe CalculateScore do
  subject { described_class.call(roll_sequence) }

  context 'on a given roll sequence' do
    let(:roll_sequence) { 'XXXXXXXXXXXX' }

    it 'returns total score of the game' do
      expect(subject).to eq(300)
    end
  end
end
