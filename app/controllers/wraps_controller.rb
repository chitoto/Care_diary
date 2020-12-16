class WrapsController < ApplicationController
  before_action :set_wrap, only: [:show, :edit, :update, :destroy]

  def index
    @wraps = Wrap.all.order(date_record: :desc)
  end

  def new
    @wrap = Wrap.new
    @wrap.conditions.build
    @wrap.meals.build
    @wrap.excretions.build
    @wrap.medicines.build
    @wrap.walks.build
    @wrap.pet_id = params[:pet_id]
  end

  def create
    @wrap = Wrap.new(wrap_params)
    @wrap.pet_id = params[:pet_id]
    if @wrap.save
      redirect_to pet_wraps_path(@wrap.pet_id), notice: "介護記録を登録しました！"
    else
      redirect_to new_pet_wrap_path(@wrap.pet_id), notice: "介護記録の登録に失敗しました！"
    end
  end

  def show
  end

  def edit
    @wrap.conditions.build if @wrap.conditions.blank?
    @wrap.meals.build if @wrap.meals.blank?
    @wrap.excretions.build if @wrap.excretions.blank?
    @wrap.medicines.build if @wrap.medicines.blank?
    @wrap.walks.build if @wrap.walks.blank?
  end

  def update
    if @wrap.update(update_wrap_params)
      redirect_to pet_wraps_path(@wrap.pet_id), notice: "介護記録を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @wrap.destroy
    redirect_to pet_wraps_path(@wrap.pet_id), notice:"削除しました！"
  end

  private

  def wrap_params
    params.require(:wrap).permit(:id, :precaution_title, :precaution_content, :date_record, :pet_id,
    conditions_attributes: [ :id, :start_time, :weight, :temperature, :memo ],
    meals_attributes: [ :id, :start_time, :shape, :amount, :memo ],
    excretions_attributes: [ :id, :start_time, :shape, :amount, :smell, :memo ],
    medicines_attributes: [ :id, :start_time, :shape, :memo ],
    walks_attributes: [ :id, :start_time, :how_many, :memo ]
    )
  end

  def update_wrap_params
    params.require(:wrap).permit(:id, :precaution_title, :precaution_content, :date_record, :pet_id,
    conditions_attributes: [ :id, :start_time, :weight, :temperature, :memo, :_destroy ],
    meals_attributes: [ :id, :start_time, :shape, :amount, :memo, :_destroy ],
    excretions_attributes: [ :id, :start_time, :shape, :amount, :smell, :memo, :_destroy ],
    medicines_attributes: [ :id, :start_time, :shape, :memo, :_destroy ],
    walks_attributes: [ :id, :start_time, :how_many, :memo, :_destroy ]
    )
  end

  def set_wrap
    params[:id] = params[:wrap_id] if params[:id].nil?
    @wrap = Wrap.find(params[:id])
  end

end
