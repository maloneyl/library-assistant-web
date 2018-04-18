class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :isbn, index: true
      t.string :title
      t.string :author
      t.string :year
      t.string :link
      t.string :image_url
      t.string :average_rating
      t.timestamps
    end
  end
end
