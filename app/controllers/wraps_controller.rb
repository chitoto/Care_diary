class WrapsController < ApplicationController
  before_action :set_wrap, only: [:show, :edit, :update, :destroy]

  def index
    @wraps = Wrap.all
  end

  def new

    @wrap = Wrap.new
  end

  def create
    @id = params[:pet_id].to_i
    @pet = Pet.find(@id)
    @wrap = @pet.wraps.build(wrap_params)
    if params[:back]
      render :new
    else
      if @wrap.save
        redirect_to pet_wraps_path(@wrap), notice: "日付を登録しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @wrap.update(wrap_params)
      redirect_to pet_wraps_path(@wrap), notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @wrap.destroy
    redirect_to pet_wraps_path(@wrap), notice:"削除しました！"
  end

  private

  def wrap_params
    params.require(:wrap).permit(:precaution_title, :precaution_content, :date_record, :pet_ids)
  end

  def set_wrap
    @wrap = Wrap.find(params[:id])
  end

end
