# frozen_string_literal: true

require './spec/spec_helper'

require 'engine/bank'
require 'engine/corporation/base'
require 'engine/share'
require 'engine/share_pool'
require 'engine/share_price'
require 'engine/player'

module Engine
  describe SharePool do
    let(:bank) { Bank.new(1000) }
    let(:player) { Player.new('a') }
    let(:corporation) { Corporation::Base.new('a', name: 'a', tokens: 1) }
    let(:share_price) { SharePrice.from_code('10', 0, 0) }
    let(:subject) { SharePool.new([corporation], bank) }
    let(:share) { Share.new(corporation, subject, president: true, percent: 20) }

    before :each do
      player.add_cash(100)
      corporation.share_price = share_price
    end

    describe '#buy_share' do
      it 'sends money and share to right place' do
        expect { subject.buy_share(player, share) }.to change { bank.cash }.by(10)
      end
    end

    describe '#sell_share' do
      before :each do
        subject.buy_share(player, share)
      end

      it 'sends money and share to right place' do
        expect { subject.sell_share(share) }.to change { bank.cash }.by(-10)
      end
    end
  end
end
