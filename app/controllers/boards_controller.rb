class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
    @boards = @boards.page(params[:page]).per(5)
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    if @board.user_id == current_user.id
      respond_to do |format|
        if @board.update(board_params)
          format.html { redirect_to @board, notice: 'Board was successfully updated.' }
          format.json { render :show, status: :ok, location: @board }
        else
          format.html { render :edit }
          format.json { render json: @board.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @board, notice: "投稿したユーザー以外は編集できません！"
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    if @board.user_id == current_user.id
      @board.destroy
      respond_to do |format|
        format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to @board, notice: "投稿したユーザー以外は削除できません！"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:user_id, :title, :content)
    end
end
