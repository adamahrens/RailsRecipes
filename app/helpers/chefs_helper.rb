module ChefsHelper
  def chef_is_current_user(chef)
    chef == current_chef || current_chef&.admin?
  end
end
