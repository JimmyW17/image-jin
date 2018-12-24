class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :label
      t.text :url
      t.references :user
      t.references :album
      t.timestamps
    end
  end
end
