describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()

  it "constructor should create a card collection", ->
    expect(deck.length).toBe 52

  describe 'hit', ->
    it "should give the last card from the deck", ->
      hand = deck.dealPlayer()
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48
