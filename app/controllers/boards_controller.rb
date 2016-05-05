class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end 

  def new
    @board = Board.new
  end 

  def create
    @boards = Board.all
    @board = Board.new board_params
    @board.update_attribute("user", current_user)
    @board.save!
    render 'show'
  end 

  def show
    @board = Board.find params[:id]
  end 

  def edit
    @board = Board.find params[:id]
  end 

  def update
    @board = Board.find params[:id]
    @board.update(board_params)
    redirect_to boards_path
  end 

  def destroy
    @board = Board.find params[:id]
    @board.destroy!
    redirect_to boards_path
  end 

  def my_boards
    @my_boards = Board.where(:user_id => current_user.id)
  end 

  def add_pin_to_board
    @board = Board.find params[:board]
    @pin = Pin.find params[:pin]
    @pin.boards << @board
    render 'show'
  end 

  private 

  def board_params
    params.require(:board).permit(:name, :subtitle, :user_id)
  end 

end 