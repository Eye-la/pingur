class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :url
      t.string :title
      t.string :author
      t.integer :rating
      t.text :note

      t.timestamps null: false
    end
  end
end
