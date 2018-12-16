class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false, default: ""
      t.timestamps
    end
  end
end
