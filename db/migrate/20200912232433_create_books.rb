class CreateBooks < ActiveRecord::Migration[6.0]
  def up
    create_table :books do |t|

      t.text "title", :limit => 100, :null => false
      t.text "author", :limit => 100, :null => false, :default => 'author'
      t.text "genre", :limit => 50, :null => false, :default => 'genre'
      t.integer "price", :null => false, :default => -1
      t.text "published_date", :limit => 100, :null => false, :default => 'published date'
      
      t.timestamps
    end
  end

  def def down 
    drop_table :books
  end
end
