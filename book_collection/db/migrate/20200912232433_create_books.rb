class CreateBooks < ActiveRecord::Migration[6.0]
  def up
    create_table :books do |t|

      t.string "title", :limit => 100, :null => false
      t.string "author", :limit => 100, :null => false, :default => 'author'
      t.string "genre", :limit => 50, :null => false, :default => 'genre'
      t.integer "price", :null => false, :default => -1
      t.string "published_date", :limit => 100, :null => false, :default => 'published date'
      
      t.timestamps
    end
  end

  def def down 
    drop_table :books
  end
end
