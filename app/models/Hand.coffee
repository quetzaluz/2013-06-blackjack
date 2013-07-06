class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> 
    @add(@deck.pop()).last()
    unless @isDealer
      @trigger('findWinner') 


  stand: -> 
    @trigger('turn', @isDealer)

  newHand: -> 
    @resetHand()
    @deck.shuffleCards()
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
      else @dealerTurn()
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
      score + card.get 'value'
    , 0
    if hasAce then [score, score + 10] else [score]

  displayScore: ->
    console.log
    if @isDealer and @scores()[0] < 21
      return "???"
    else if not @isDealer and @scores()[0] <= 21
      return @scores()[0]
    else if @scores()[0] > 21
      return "BUSTED: #{ @scores()[0] }"