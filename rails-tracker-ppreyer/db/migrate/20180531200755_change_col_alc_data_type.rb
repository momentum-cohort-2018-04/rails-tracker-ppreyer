class ChangeColAlcDataType < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :alcohol, :string
    add_column :beers, :alcohol, :float
  end
end
