class AddSeenColToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :seen, :boolean
  end
end
