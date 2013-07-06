describe "card", ->
  card = null

  beforeEach ->
    card = new Card rank:0, suit:2

  it "should have a rank and suit", ->    
    expect(card.get 'suitName').toEqual 'Clubs'
    expect(card.get 'rankName').toEqual 'King'
