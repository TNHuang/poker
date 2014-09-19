require 'deck'

describe Deck do

  let (:deck) { Deck.new }
  let(:temp_deck) { [Card.new, Card.new, Card.new] }
  let(:shuffle_deck) { Deck.new.shuffle }
  describe do

    it "should have 52 cards in deck as default" do
      expect(deck.count).to be(52)
    end

    it "should take a card out of the deck" do
      deck.take(1)
      expect(deck.count).to be(51)
    end

    it "take should return a card in an array" do
      expect(deck.take(1)[0].class).to be(Card)
    end
    it "should be unable to take more cards than a deck has" do
      expect { deck.take(53) }.to raise_error(TooFewCardError)
    end

    it "able to add the card back into deck" do
      expect(deck.add(temp_deck).count).to be(55)
    end

    it "should be able to shuffle itself" do
      expect(deck.take(1) != shuffle_deck.take(1)).to be true
    end

  end

end
