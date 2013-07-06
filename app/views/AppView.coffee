class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="reset-button">Play Again!</button>
    <div class="score-board">Player Score: <span class="player-score">0</span>Dealer Score: <span class="dealer-score">0</span></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> 
      if !@model.get('gameOver') and !@model.get('turn')
        @model.get('playerHand').hit()
    "click .stand-button": -> 
      if !@model.get('gameOver') and !@model.get('turn')
        @model.get('playerHand').stand()
    "click .reset-button": ->
      @model.trigger('newGame')
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
