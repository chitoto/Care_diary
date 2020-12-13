class AssignsController < ApplicationController
  before_action :email_exist?, only: [:create]
  before_action :user_exist?, only: [:create]

  def create
    group = find_group(params[:group_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      group.invite_member(user)
      redirect_to group_url(group), notice: I18n.t('views.messages.assigned')
    else
      redirect_to group_url(group), notice: I18n.t('views.messages.failed_to_assign')
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    destroy_message = assign_destroy(assign, assign.user)

    redirect_to group_url(params[:group_id]), notice: destroy_message
  end

  private

  def assign_params
    params[:email]
  end

  def assign_destroy(assign, assigned_user)
    if assigned_user == assign.group.owner
      I18n.t('views.messages.cannot_delete_the_leader')
    elsif Assign.where(user_id: assigned_user.id).count == 1
      I18n.t('views.messages.cannot_delete_only_a_member')
    elsif assign.destroy
      set_next_group(assign, assigned_user)
      I18n.t('views.messages.delete_member')
    else
      I18n.t('views.messages.cannot_delete_member_4_some_reason')
    end
  end

  def email_exist?
    group = find_group(params[:group_id])
    if group.members.exists?(email: params[:email])
      redirect_to group_url(group), notice: I18n.t('views.messages.email_already_exists')
    end
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    group = find_group(params[:group_id])
    unless User.exists?(email: params[:email])
      redirect_to group_url(group), notice: I18n.t('views.messages.does_not_exist_email')
    end
  end

  def set_next_group(assign, assigned_user)
    another_group = Assign.find_by(user_id: assigned_user.id).group
    change_keep_group(assigned_user, another_group) if assigned_user.keep_group_id == assign.group_id
  end

end
