describe "card", ->

  it "should have the set properties: suitName, rankName, value, revealed", ->
    card = new Card rank:0, suit:2
    expect(card.get 'revealed').toBe true
    expect(card.get 'value').toEqual 10
    expect(card.get 'suitName').toEqual 'Clubs'
    expect(card.get 'rankName').toEqual 'King'

  it "should have a flip method that toggles whether the card is revealed", ->
    card = new Card rank:0, suit:2
    expect(card.get 'revealed').toBe true
    card.flip()
    expect(card.get 'revealed').toBe false
    card.flip()
    expect(card.get 'revealed').toBe true

