class AddIdsToBeerAndNote < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :beer_id, :integer
    add_column :notes, :note_id, :integer
  end
end
