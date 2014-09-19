class TooManyCardsError < StandardError
end

class Hand
  VALUES = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  RANKING = [
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]


  attr_accessor :cards

  def initialize
    @cards = []
  end

  def dealt_card(card)
    raise TooManyCardsError if @cards.count == 5
    @cards << card
  end

  def high_card
    @cards.max_by {|el| VALUES[el.value]  }
  end

  def flush?
    current_suit = @cards[0].suit
    @cards.all? { |el| el.suit == current_suit }
  end

  def straight?
    straight_array = (values.min..values.max).to_a
    values.sort == straight_array || values.sort == [2,3,4,5,14]
  end

  def num_of_a_kind?(n)
    frequency.values.any? { |val| val > n-1 }
  end

  def two_pair?
    frequency.values.select { |freq| freq > 1 }.count > 1
  end

  def full_house?
    frequency.values.any? {|freq| freq == 3 } &&
    frequency.values.any? { |freq| freq == 2}
  end

  def straight_flush?
    self.straight? && self.flush?
  end

  def beats?(opponent_hand)
    result = rank(self) <=> rank(opponent_hand)
    case result
    when -1
      return true
    when 1
      false
    when 0
      #tie breaker
    end

  end

  def tie_breaker(opponent_hand)
    self_sorted_hand = frequency.sort_by {|key, val| key }.sort_by {|key, val| val}.reverse
    opponent_sorted_hand = opponent_hand.frequency.sort_by {|key, val| key }
    opponent_sorted_hand = opponent_sorted_hand.sort_by {|key, val| val}.reverse

    self_sorted_hand.keys.each_with_index do |val, index|
      result = val <=> opponent_sorted_hand.keys[index]
      case result
      when 1
        return true
      when -1
        return false
      when 0
      end
    end
    "tie"
  end

  def rank(hand)
    if hand.straight_flush?
      0
    elsif hand.num_of_a_kind?(4)
      1
    elsif hand.full_house?
      2
    elsif hand.flush?
      3
    elsif hand.straight?
      4
    elsif hand.num_of_a_kind?(3)
      5
    elsif hand.two_pair?
      6
    elsif hand.num_of_a_kind?(2)
      7
    else
      8
    end
  end

  def values
    @cards.map { |el| VALUES[el.value] }
  end

  def frequency
    freq = Hash.new(0)
    values.each do |val|
      freq[val] += 1
    end
    freq
  end

end