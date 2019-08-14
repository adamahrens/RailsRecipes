module ApplicationHelper
  def navigation_items
    if session[:chef_id]
      [
        link_to('Home', root_path, class: 'nav-link'),
        link_to('About', about_path, class: 'nav-link'),
        link_to('Recipes', recipes_path, class: 'nav-link'),
        link_to('New Recipe', new_recipe_path, class: 'nav-link'),
        link_to('Chefs', chefs_path, class: 'nav-link'),
        link_to('New Chef', signup_path, class: 'nav-link'),
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
end
