#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'turn', false
    @set 'gameOver', false
    @get('playerHand').on 'turn', (isDealer) =>
    	if !isDealer 
        #detects that the player called the end of their turn
        @set 'turn', true
        @get('dealerHand').dealerTurn()
    @get('playerHand').on 'busted', =>
      console.log 'Player busted!'
      @set 'gameOver', true
    @get('dealerHand').on 'busted', =>
      console.log 'Dealer busted!'
      @set 'gameOver', true
    @get('playerHand').on 'newGame', =>
      @set 'gameOver', false
      @set 'turn', false
    @get('dealerHand').on 'findWinner', =>
      console.log "Put method for finding winner here!"