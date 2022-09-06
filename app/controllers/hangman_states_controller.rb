class HangmanStatesController < ApplicationController

  def index
    # list of all games
    @games = HangmanState.all
  end
  # think about what actions user will take and turn them into controller actions

  def show
    # show one game
    @game = HangmanState.find(params[:id])
  end

  # update

  # delete

  # new i.e. used to build the form
  def new
    @game = HangmanState.new # start game?
  end

  # create i.e. creating an instance of the game model, doesn't usually have a view/page, just redirect to show page
  def create
    @game = HangmanState.new
    @game.word = @game.random_word

    if @game.save
      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end
  end


end
