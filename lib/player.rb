class Player
  attr_accessor :name
  attr_reader :pot, :hand, :bank

  def initialize(name, hand = Hand.new, bank)
    @name = name
    @hand = hand
    @pot = 0
    @bank = bank
    @active = false
  end

  def discard(indices)
    indices.each do |index|
      @hand.cards[index] = nil
    end
    @hand.cards.compact!
  end

  def fold
    @active = false
  end

  def active?
    @active
  end

  protected
  attr_reader :active
end