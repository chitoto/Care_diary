module PetsHelper
  def choose_new_or_edit
    if action_name == 'new'|| action_name == 'create'
      confirm_group_pets_path
    elsif action_name == 'edit'|| action_name == 'update'
      group_pets_path
    end
  end
end
