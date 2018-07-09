class AddDeleteIdColumnsBeerNote < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :beer_id, :integer
    remove_column :notes, :note_id, :integer
    add_column :beers, :note_id, :integer
    add_column :notes, :beer_id, :integer
  end
end
