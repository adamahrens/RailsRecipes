# == Schema Information
#
# Table name: chefs
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(name: 'Leroy Jenkins', email: 'leroy.jenkins@apps.com', password: 'password1234', password_confirmation: 'password1234')
  end

  test 'chef password should be present' do
    @chef.password = ' '
    @chef.password_confirmation = ' '
    assert_not @chef.valid?
  end

  test 'chef password should meet minimum of five' do
    pass = '!' * 4
    @chef.password = pass
    @chef.password_confirmation = pass
    assert_not @chef.valid?
  end

  test 'chef name should be present' do
    assert @chef.valid?
    @chef.name = ''
    assert_not @chef.valid?
    @chef.name = '     '
    assert_not @chef.valid?
  end

  test 'chef email should be present' do
    assert @chef.valid?
    @chef.email = ''
    assert_not @chef.valid?
    @chef.email = '     '
    assert_not @chef.valid?
  end

  test 'chef name should be less than 31 characters' do
    @chef.name = 'a' * 31
    assert_not @chef.valid?
    @chef.name = 'a' * 30
    assert @chef.valid?
  end

  test 'chef email should be correct format' do
    assert @chef.valid?
    @chef.email = 'adfasdf'
    assert_not @chef.valid?
    @chef.email = 'asdfasd.asdfas.@dsfsdfsdfds.ccccssd@'
    assert_not @chef.valid?
  end

  test 'chef email should be unique' do
    other_chef = Chef.new(name: 'Duplicate Jenkins', email: 'leroy.jenkins@apps.com')
    @chef.save
    assert_not other_chef.valid?
  end
end
