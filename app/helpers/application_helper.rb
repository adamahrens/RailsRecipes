module ApplicationHelper
  def navigation_items
    if session[:chef_id]
      profile_link_text = current_chef.admin? ? 'My Profile (Admin)' : 'My Profile'
      [
        link_to('Home', root_path, class: 'nav-link'),
        link_to('About', about_path, class: 'nav-link'),
        link_to('Recipes', recipes_path, class: 'nav-link'),
        link_to('New Recipe', new_recipe_path, class: 'nav-link'),
        link_to('Ingredients', ingredients_path, class: 'nav-link'),
        link_to('Chefs', chefs_path, class: 'nav-link'),
        link_to('New Chef', signup_path, class: 'nav-link'),
        link_to(profile_link_text, chef_path(current_chef), class: 'nav-link'),
        link_to('Logout', logout_path, method: :delete, class: 'nav-link')
      ]
    else
      [
        link_to('Home', root_path, class: 'nav-link'),
        link_to('About', about_path, class: 'nav-link'),
        link_to('Login', login_path, class: 'nav-link')
      ]
    end
  end

  def current_chef
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
    current_chef.nil? == false
  end
end
