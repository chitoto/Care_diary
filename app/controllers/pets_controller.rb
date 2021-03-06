class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :admin?, only: [:index]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    @pet[:group_id] = params[:group_id] 
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet.id), notice: "ペットを登録しました！"
    else
      render :new
    end
  end

  def show
    @comments = @pet.comments
    @comment = @pet.comments.build
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pets_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice:"削除しました！"
  end

  private

  def pet_params
    params.require(:pet).permit(:id,:name, :birthday, :gender, :species, :icon, :icon_cache, :memo, :group_id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def admin?
    current_user.admin?
  end

end
