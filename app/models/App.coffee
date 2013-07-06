#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'turn', false
    @set 'gameOver', false #when setting to something other than false, string denoting winner

    @on 'change:gameOver', =>
      $('.covered').removeClass 'covered'
      if @get('dealerHand').scores()[0] <= 21
        $('.dealer-hand-container').find('.score').text @get('dealerHand').scores()[0]
      $(".#{@get 'gameOver'}-score").text(parseInt($(".#{@get 'gameOver'}-score").text()) + 1 )

    @get('playerHand').on 'turn', (isDealer) =>
    	if !isDealer 
        #detects that the player called the end of their turn
        @set 'turn', true
        @get('dealerHand').dealerTurn()

    @get('playerHand').on 'busted', =>
      $('.game-over-text').text "Bust! You've Lost!"
      $('.game-over').fadeIn().delay(400).fadeOut('fast')
      @set 'gameOver', 'dealer'
    @get('dealerHand').on 'busted', =>
      $('.game-over-text').text 'Dealer busted! You won!'
      $('.game-over').fadeIn().delay(400).fadeOut('fast')
      @set 'gameOver', 'player'

    @on 'newGame', ->
      @set 'gameOver', false
      @set 'turn', false
      @get('playerHand').newHand()
      @get('dealerHand').newHand()

    @get('dealerHand').on 'findWinner', =>
      #search for busted here?
      if 21 >= @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
        $('.game-over-text').text "The Dealer Has Won!"
        @set 'gameOver', 'dealer'
      if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
        $('.game-over-text').text "You have won!"
        @set 'gameOver', 'player'
      if @get('dealerHand').scores()[0] is @get('playerHand').scores()[0]
        $('.game-over-text').text "It's a tie!"
        @set 'gameOver', true
      $('.game-over').fadeIn().delay(400).fadeOut('fast')

