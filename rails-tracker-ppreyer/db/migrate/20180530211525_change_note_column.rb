class ChangeNoteColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :content, :string
  end
end
