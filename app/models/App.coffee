#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'turn', false
    @set 'gameOver', false

    @on 'change:gameOver', =>
      $('.covered').removeClass('covered')
      if @get('dealerHand').scores()[0] <= 21
        $('.dealer-hand-container').find('.score').text @get('dealerHand').scores()[0]

    @get('playerHand').on 'turn', (isDealer) =>
    	if !isDealer 
        #detects that the player called the end of their turn
        @set 'turn', true
        @get('dealerHand').dealerTurn()

    @get('playerHand').on 'busted', =>
      alert 'Player busted! The Dealer Has Won!'
      @set 'gameOver', true
    @get('dealerHand').on 'busted', =>
      alert 'Dealer busted! You Have Won!'
      @set 'gameOver', true
    @on 'newGame', ->
      @set 'gameOver', false
      @set 'turn', false
      @get('playerHand').newHand()
      @get('dealerHand').newHand()

    @get('dealerHand').on 'findWinner', =>
      if 21 >= @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
        alert "The Dealer Has Won!"
        @set 'gameOver', true
      if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
        alert "You Have won!"
        @set 'gameOver', true
      if @get('dealerHand').scores()[0] is @get('playerHand').scores()[0]
        alert "It's a tie!"
        @set 'gameOver', true

