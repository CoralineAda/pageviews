class CreatePageviews < ActiveRecord::Migration
  def self.up
    create_table :pageviews do |t|
      t.string :url
      t.string :controller_name
      t.string :action_name
      t.string :http_method
      t.string :status_code
      t.string :remote_ip
      t.string :referrer
      t.timestamps
    end
    add_index :pageviews, :url
    add_index :pageviews, :remote_ip    
    add_index :pageviews, :status_code    
  end

  def self.down
    drop_table :pageviews
  end
end
