# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chef_id     :integer
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(name: 'Leroy Jenkins', email: 'leroy.jenkins@apps.com')
    @recipe = Recipe.new(name: nil, description: nil, chef: @chef)
  end

  test 'recipe is valid only when name is provided' do
    assert @recipe.valid? == false
    @recipe.name = 'Beef Stew'
    assert @recipe.valid? == true
  end
end
