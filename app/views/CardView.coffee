class window.CardView extends Backbone.View

  className: 'card'

  #OLD TEMPLATE
  #template: _.template '<%= rankName %> of <%= suitName %>'

  cardImg: ->
    thisTag = "#{rankName} of #{suitName}"

  imgLookup:
    'Ace of Spades' : './svg/ace_of_spades.svg'
    '2 of Spades' : './svg/2_of_spades.svg'
    '3 of Spades' : './svg/3_of_spades.svg'
    '4 of Spades' : './svg/4_of_spades.svg'
    '5 of Spades' : './svg/5_of_spades.svg'
    '6 of Spades' : './svg/6_of_spades.svg'
    '7 of Spades' : './svg/7_of_spades.svg'
    '8 of Spades' : './svg/8_of_spades.svg'
    '9 of Spades' : './svg/9_of_spades.svg'
    '10 of Spades' : './svg/10_of_spades.svg'
    'Jack of Spades' : './svg/jack_of_spades2.svg'
    'Queen of Spades' : './svg/queen_of_spades2.svg'
    'King of Spades' : './svg/king_of_spades2.svg'
    'Ace of Diamonds' : './svg/ace_of_diamonds.svg'
    '2 of Diamonds' : './svg/2_of_diamonds.svg'
    '3 of Diamonds' : './svg/3_of_diamonds.svg'
    '4 of Diamonds' : './svg/4_of_diamonds.svg'
    '5 of Diamonds' : './svg/5_of_diamonds.svg'
    '6 of Diamonds' : './svg/6_of_diamonds.svg'
    '7 of Diamonds' : './svg/7_of_diamonds.svg'
    '8 of Diamonds' : './svg/8_of_diamonds.svg'
    '9 of Diamonds' : './svg/9_of_diamonds.svg'
    '10 of Diamonds' : './svg/10_of_diamonds.svg'
    'Jack of Diamonds' : './svg/jack_of_diamonds2.svg'
    'Queen of Diamonds' : './svg/queen_of_diamonds2.svg'
    'King of Diamonds' : './svg/king_of_diamonds2.svg'
    'Ace of Hearts' : './svg/ace_of_hearts.svg'
    '2 of Hearts' : './svg/2_of_hearts.svg'
    '3 of Hearts' : './svg/3_of_hearts.svg'
    '4 of Hearts' : './svg/4_of_hearts.svg'
    '5 of Hearts' : './svg/5_of_hearts.svg'
    '6 of Hearts' : './svg/6_of_hearts.svg'
    '7 of Hearts' : './svg/7_of_hearts.svg'
    '8 of Hearts' : './svg/8_of_hearts.svg'
    '9 of Hearts' : './svg/9_of_hearts.svg'
    '10 of Hearts' : './svg/10_of_hearts.svg'
    'Jack of Hearts' : './svg/jack_of_hearts2.svg'
    'Queen of Hearts' : './svg/queen_of_hearts2.svg'
    'King of Hearts' : './svg/king_of_hearts2.svg'
    'Ace of Clubs' : './svg/ace_of_clubs.svg'
    '2 of Clubs' : './svg/2_of_clubs.svg'
    '3 of Clubs' : './svg/3_of_clubs.svg'
    '4 of Clubs' : './svg/4_of_clubs.svg'
    '5 of Clubs' : './svg/5_of_clubs.svg'
    '6 of Clubs' : './svg/6_of_clubs.svg'
    '7 of Clubs' : './svg/7_of_clubs.svg'
    '8 of Clubs' : './svg/8_of_clubs.svg'
    '9 of Clubs' : './svg/9_of_clubs.svg'
    '10 of Clubs' : './svg/10_of_clubs.svg'
    'Jack of Clubs' : './svg/jack_of_clubs2.svg'
    'Queen of Clubs' : './svg/queen_of_clubs2.svg'
    'King of Clubs' : './svg/king_of_clubs2.svg'

  imgURL: ->
   @imgLookup["#{@model.attributes.rankName} of #{@model.attributes.suitName}"] if @model

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: =>
    @$el.children().detach().end().html
    @$el.html("<img src='#{@imgURL()}' width='100px'/>")
    @$el.addClass 'covered' unless @model.get 'revealed'
