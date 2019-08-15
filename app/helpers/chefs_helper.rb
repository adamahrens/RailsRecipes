module ChefsHelper
  def chef_is_current_user(chef)
    chef == current_chef
  end
end
