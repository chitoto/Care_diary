class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all.order(updated_at: :desc)
  end

  def new
    @group = Group.new
    @group.assigns.build
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save(group_params)
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to pets_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @group_owner = @group.users.find_by(id: params[:owner_id])
    # if !@group.users.include?(current_user)
    #   @group.users = current_user
    # end
    @groups = Group.where(group_id: @group.id).all
  end

  private
  def group_params
    params.require(:group).permit(:name, :owner_id, :icon, :icon_cache,
    assigns_attributes: [ :id, :user_ids[], :group_ids[], :_destroy ])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
