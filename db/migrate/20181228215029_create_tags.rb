class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :description
      t.integer :images_count
      t.timestamps
    end

    create_table :image_tags do |t|
      t.integer :image_id
      t.integer :tag_id
      t.string :description
      t.decimal :score
    end
  end
end
