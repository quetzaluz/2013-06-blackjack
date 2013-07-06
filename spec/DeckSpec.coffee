describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()

  it "should create a card collection with 52 cards", ->
    expect(deck.length).toBe 52

  
  it "should deal hands with two cards in each hand", ->
    expect(deck.length).toBe 52
    playerHand = deck.dealPlayer()
    expect(deck.length).toBe 50
    dealerHand = deck.dealDealer()
    expect(deck.length).toBe 48

  describe 'hit', ->
    it "should give the last card from the deck", ->
      hand = deck.dealPlayer()
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48
