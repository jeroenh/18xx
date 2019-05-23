# frozen_string_literal: true

require './spec/spec_helper'

require 'engine/game/g_1889'

module Engine
  describe Game::G1889 do
    let(:players) { [Player.new('a'), Player.new('b')] }
    subject { Game::G1889.new(players) }

    context 'on init' do
      it 'starts with correct cash' do
        expect(subject.bank.cash).to eq(4600)
        expect(subject.players.map(&:cash)).to eq([1200, 1200])
      end

      it 'starts with an auction' do
        expect(subject.round).to be_a(Round::PrivateAuction)
      end
    end
  end
end
