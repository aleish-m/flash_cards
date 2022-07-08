require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(@cards)
  end

  it 'the deck exists' do
    expect(@card_1).to be_instance_of(Card)
    expect(@deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
  end

  it 'can count the number of cards it has' do
    expect(@deck.count).to eq(3)
  end

  it 'can call cards by category' do
    expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3])
  end

  it 'can call cards by a different category' do
    expect(@deck.cards_in_category(:Geography)).to eq([@card_1])
    expect(@deck.cards_in_category("Pop Culture")).to eq([])
  end

end