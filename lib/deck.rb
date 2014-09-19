require_relative 'card'

class TooFewCardError < StandardError
end

class Deck

  def initialize
    @deck = Deck.new_deck
  end

  def self.new_deck
    cards = []
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_NUMBERS.keys.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  def count
    @deck.count
  end

  def take(n)
    raise TooFewCardError if n > @deck.count
    @deck.shift(n)
  end

  def add(cards)
    @deck.concat(cards)
  end

  def shuffle
    @deck = @deck.shuffle
  end

end