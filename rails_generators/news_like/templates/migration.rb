class Create<%= plural_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= plural_name %> do |t|
      t.string :title
      t.text :body
	  t.boolean :delta, :default => true, :null => false 
      t.timestamps
    end
  end

  def self.down
    drop_table :<%= plural_name %>
  end
end
