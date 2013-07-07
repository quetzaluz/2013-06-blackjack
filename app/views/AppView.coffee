class window.AppView extends Backbone.View

  template: _.template "
    <button class='hit-button'>Hit</button> <button class='stand-button'>Stand</button><button class='reset-button'>Play Again!</button><form class='bet-form'><input type='text' class='bet-amount'></input></form><button class='bet-button'>Bet!</button>
    <div class='score-board'>Player Chips: <span class='player-chips'><%= chips %></span>Your Bet: <span class='player-bet'><%= bet %></span></div>
    <div class='score-board'>Player Wins: <span class='player-score'>0</span>Dealer Wins: <span class='dealer-score'>0</span></div>
    <div class='player-hand-container'></div>
    <div class='dealer-hand-container'></div>
  "

  events:
    "click .bet-button": ->
      if parseInt($('.bet-amount').val()) >= 0
        @model.set('bet', parseInt($('.bet-amount').val()))

    "click .hit-button": -> 
      if !@model.get('gameOver') and !@model.get('turn')
        @model.get('playerHand').hit()
    "click .stand-button": -> 
      if !@model.get('gameOver') and !@model.get('turn')
        @model.get('playerHand').stand()
    "click .reset-button": ->
      @model.trigger('newGame')
    "click .game-over": ->

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template
      chips: @model.get 'chips'
      bet: @model.get 'bet'
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
