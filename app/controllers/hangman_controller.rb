class HangmanController < ApplicationController

  def index
    # list of all games
  end
  # think about what actions user will take and turn them into controller actions

  def show
    # show one game
    @game = HangmanState.find(params[:id])
  end

  # update

  # delete

  # new i.e. the form

  # create i.e. creating an instance of the game model, doesn't usually have a view/page, just redirect to show page



end
