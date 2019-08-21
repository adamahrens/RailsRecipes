class AddingChefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :chef, foreign_key: true
  end
end
