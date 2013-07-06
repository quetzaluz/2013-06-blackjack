class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> @add(@deck.pop()).last()

  stand: -> 
    @trigger('turn', @isDealer)

  newHand: -> 
    @resetHand()
    @deck.shuffleCards()
    @trigger('newGame') #later pass in params for score keeping
    if @isDealer
      @add(@deck.pop().flip())
      @add(@deck.pop())
    else 
      @hit()
      @hit()

  resetHand: ->
    # remove from hand, add to deck
    for card in @models
      @deck.add(@pop().set 'revealed', true)

  dealerTurn: ->
    if @isDealer
      console.log "Dealer Turn"
      @hit() if @scores()[0] < 17
      if @scores()[0] >= 17
        @trigger('findWinner') 
    if not @isDealer 
      console.log "Error! Player is trying to take DealerTurn"

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
