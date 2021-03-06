module RecipesHelper
  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def recipe_owner_is_current_user?(recipe)
    recipe.chef == current_chef || current_chef&.admin?
  end
end
