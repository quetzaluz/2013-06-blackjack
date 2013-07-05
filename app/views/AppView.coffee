class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="reset-button">Play Again!</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> 
      if !window.busted
        @model.get('playerHand').hit()
    "click .stand-button": -> 
      if !window.busted
        @model.get('playerHand').stand()
    "click .reset-button": ->
      @model.get('playerHand').newHand() 
      @model.get('dealerHand').newHand()
      @render
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
