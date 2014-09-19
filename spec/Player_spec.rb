require 'player'

describe Player do
  let(:hand) { double(:hand) }
  subject(:player) { Player.new("Name", hand, 100) }
  it 'should have a name' do
    expect(player.name.nil?).to be false
  end

  it 'pot should start with 0' do
    expect(player.pot).to eq(0)
  end

  it 'should have bank account' do
    expect(player.bank > 0).to be true
  end

  it 'should be able to discard cards' do
    hand.stub(:cards).and_return([1,2,3,4,5])
    player.discard([0,1,2])
    expect(player.hand.cards).to eq([4, 5])
  end

  it 'should be able fold' do
    player.fold
    expect(player.active?).to be false
  end

  it 'should be able to see' do
    # player.call
    # expect(player.)
  end
  it 'should be able to raise'
  it 'player shouldnt be able to discard more than three cards'

end