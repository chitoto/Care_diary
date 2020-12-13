class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def show
    @working_group = @group
    change_keep_group(current_user, @group)
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      @group.invite_member(@group.owner)
      redirect_to @group, notice: I18n.t('views.messages.create_group')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_group')
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: I18n.t('views.messages.update_group')
    else
      flash.now[:error] = I18n.t('views.messages.failed_to_save_group')
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: I18n.t('views.messages.delete_group')
  end

  def dashboard
    @group = current_user.keep_group_id ? Group.find(current_user.keep_group_id) : current_user.groups.first
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.fetch(:group, {}).permit( :name, :icon, :icon_cache, :owner_id, :keep_group_id)
  end
end
