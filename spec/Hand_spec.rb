require 'hand'

describe Hand do

  let(:deck) { double(:card) }
  let(:hand2) { Hand.new }
  subject(:hand) { Hand.new }

  let(:card1) { double(:card1)}
  let(:card2) { double(:card2)}
  let(:card3) { double(:card3)}
  let(:card4) { double(:card4)}
  let(:card5) { double(:card5)}
  let(:card6) { double(:card6)}
  let(:card7) { double(:card7)}
  let(:card8) { double(:card8)}
  let(:card9) { double(:card9)}
  let(:card10) { double(:card10)}
  let(:card11) { double(:card11)}

  it "should hold cards" do
    card1.stub(:value).and_return(:eight)
    card1.stub(:suit).and_return(:clubs)
    hand.dealt_card(card1)
    expect(hand.cards.include?(card1)).to be true

  end

  it "should not hold more than five cards" do
    hand.dealt_card(card1)
    hand.dealt_card(card1)
    hand.dealt_card(card1)
    hand.dealt_card(card1)
    hand.dealt_card(card1)

    expect{ hand.dealt_card(card1)}.to raise_error(TooManyCardsError)
  end

  context "test hands" do
    before(:each) do
      card1.stub(:value).and_return(:ace)
      card1.stub(:suit).and_return(:clubs)

      card2.stub(:value).and_return(:deuce)
      card2.stub(:suit).and_return(:clubs)

      card3.stub(:value).and_return(:three)
      card3.stub(:suit).and_return(:clubs)

      card4.stub(:value).and_return(:five)
      card4.stub(:suit).and_return(:clubs)

      card5.stub(:value).and_return(:four)
      card5.stub(:suit).and_return(:clubs)

      card6.stub(:value).and_return(:king)
      card6.stub(:suit).and_return(:clubs)

      card7.stub(:value).and_return(:eight)
      card7.stub(:suit).and_return(:hearts)

      card8.stub(:value).and_return(:eight)
      card8.stub(:suit).and_return(:diamonds)

      card9.stub(:value).and_return(:eight)
      card9.stub(:suit).and_return(:spades)

      card10.stub(:value).and_return(:king)
      card10.stub(:suit).and_return(:spades)

      card11.stub(:value).and_return(:eight)
      card11.stub(:suit).and_return(:clubs)

      hand.dealt_card(card1)
      hand.dealt_card(card2)
      hand.dealt_card(card3)
      hand.dealt_card(card4)
      hand.dealt_card(card5)
      hand2.dealt_card(card6)
      hand2.dealt_card(card7)
      hand2.dealt_card(card8)
      hand2.dealt_card(card9)
      hand2.dealt_card(card10)
    end

    it 'should give high card' do
      expect(hand2.high_card).to be(card6)
    end

    it 'should give flush' do
      expect(hand.flush?).to be true
    end

    it 'should give straight' do
      expect(hand.straight?).to be true
    end

    it 'should recognize not a straight' do
      expect(hand2.straight?).to be false
    end

    it 'should give pair' do
      expect(hand2.num_of_a_kind?(2)).to be true
    end

    it 'should give two pair' do
      expect(hand2.two_pair?).to be true
    end

    it 'should give three of a kind' do
      expect(hand2.num_of_a_kind?(3)).to be true
    end

    it 'should give four of kind' do
      hand2.cards.pop
      hand2.dealt_card(card11)
      expect(hand2.num_of_a_kind?(4)).to be true
    end

    it 'should give full house' do
      expect(hand2.full_house?).to be true
    end

    it 'should not give full house' do
      expect(hand.full_house?).to be false
    end

    it 'should give a straight flush' do
      expect(hand.straight_flush?).to be true
    end

    it 'should compare hands' do
      expect(hand.beats?(hand2)).to be true
    end
  end

end


