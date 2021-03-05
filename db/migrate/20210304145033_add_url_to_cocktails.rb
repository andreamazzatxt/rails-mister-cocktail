class AddUrlToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :url, :string
  end
end
