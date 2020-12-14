class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all.order(owner_id: :desc)
  end

  def show
    @group_owner = User.find(@group.owner_id)
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      @group.add_group_member(@group.owner, @group)
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
    @group.destroy
    redirect_to groups_url, notice: 'グループを削除しました'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.fetch(:group, {}).permit( :name, :icon, :icon_cache, :owner_id)
  end
end
