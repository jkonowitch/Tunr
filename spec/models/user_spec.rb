require 'spec_helper'

describe User do
  describe "#afford?" do
    before { load "#{Rails.root}/db/seeds.rb" }

    let(:song) { Song.first }
    let(:user) { User.first }

    context "when affordable" do
      before { user.update(balance: 1.0) }

      it "returns true" do
        expect(user.afford?(song)).to be_true
      end
    end

    context "when unaffordable" do
      it "returns false" do
        expect(user.afford?(song)).to be_false
      end
    end
  end
end