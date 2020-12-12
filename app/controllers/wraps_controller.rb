class WrapsController < ApplicationController
  before_action :set_wrap, only: [:show, :edit, :update, :destroy]

  def index
    @wraps = Wrap.all
  end

  def new
    @id = params[:pet_id].to_i
    @wrap = Wrap.new
    @wrap.conditions.build
    @wrap.meals.build
    @wrap.excretions.build
    @wrap.medicines.build
    @wrap.walks.build
    @wrap.pet_id = @id
  end

  def create
    @wrap = Wrap.new(wrap_params)
    if @wrap.save
      redirect_to pet_wraps_path(@wrap), notice: "日付を登録しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @wrap.conditions.build
    @wrap.meals.build
    @wrap.excretions.build
    @wrap.medicines.build
    @wrap.walks.build
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
    params.require(:wrap).permit(:precaution_title, :precaution_content, :date_record, :pet_id,
    conditions_attributes: [ :id, :start_time, :weight, :temperature, :memo ],
    meals_attributes: [ :id, :start_time, :shape, :amount, :memo ],
    excretions_attributes: [ :id, :start_time, :shape, :amount, :smell, :memo ],
    medicines_attributes: [ :id, :start_time, :shape, :memo ],
    medicines_attributes: [ :id, :start_time, :how_many, :memo ]
    )
  end

  def set_wrap
    @wrap = Wrap.find(params[:id])
  end

end
