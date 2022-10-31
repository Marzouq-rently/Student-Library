class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.text :url
      t.belongs_to :pictureable, polymorphic: true
      t.timestamps
    end
  end
end
