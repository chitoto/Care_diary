class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :group_owner?, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all.order(owner_id: :desc)
    @search = Group.ransack(params[:q])
    @groups = @search.result
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      @group.assigns_create(@group.owner, @group)
      redirect_to @group, notice: 'グループを作成しました！'
    else
      flash.now[:error] = 'グループ作成に失敗しました！'
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'グループを編集しました！'
    else
      flash.now[:error] = 'グループ編集に失敗しました！'
      render :edit
    end
  end

  def destroy
    @group.members.destroy
    @group.destroy
    redirect_to groups_url, notice: 'グループを削除しました！'
  end

  def add_member
    group_id = params[:group]
    @group = Group.find(group_id)
    @group.assigns_create(current_user, @group)
    redirect_to group_path(group_id)
  end

  def delete_member
    @group = Group.find(params[:group_id])
    @assign = @group.assigns.where(user_id: params[:user_id])
    @assign.destroy_all
    redirect_to group_path(params[:group_id])
  end

  def change_owner
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])
    @group.owner = @user
    @group.save!
    redirect_to group_path(params[:group_id])
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.fetch(:group, {}).permit( :name, :icon, :icon_cache, :owner_id)
  end

  def group_owner?
    current_user == @group.owner
  end

end
