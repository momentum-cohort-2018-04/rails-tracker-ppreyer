class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :hop
      t.string :yeast
      t.string :malts
      t.string :ibu
      t.string :alcohol

      t.timestamps
    end
  end
end