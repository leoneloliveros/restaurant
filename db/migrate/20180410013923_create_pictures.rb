class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
