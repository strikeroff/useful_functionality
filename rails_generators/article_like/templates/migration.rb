class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.text :description      
      t.string :alias
      t.string :locale
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
