class GuessesController < ApplicationController

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
    @guess = Guess.new
  end

  # create i.e. just redirect to show page
  def create
    puts params
    @guess = Guess.new(guess: params[:guess], hangman_state_id: params[:hangman_state_id])
    @game = HangmanState.find(params[:hangman_state_id])
    if @guess.save
      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end
  end
end

