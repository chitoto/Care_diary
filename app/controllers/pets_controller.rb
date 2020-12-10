class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to new_pet_path, notice: "ペットを登録しました！"
    else
      render :new
    end
  end

  def show
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
    params.require(:pet).permit(:name, :birthday, :gender, :species, :icon, :icon_cache, :memo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

end
