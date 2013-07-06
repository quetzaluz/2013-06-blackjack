#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'turn', false
    @get('playerHand').on 'turn', (isDealer) =>
    	if isDealer
    		#Toggling from Dealer's turn to Player's turn. I don't think there will be much behavior needed here as dealer turns are so quick that the player making a turn at the same time is not a big concern.
    	  console.log 'Player Turn'
    	else @get('dealerHand').dealerTurn()