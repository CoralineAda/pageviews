class CreatePageviewCounters < ActiveRecord::Migration
  def self.up
    create_table :pageview_counters do |t|
      t.string :url
      t.string :controller_name
      t.string :action_name
      t.string :http_method
      t.string :status_code
      t.integer :views, :default => 0
      t.timestamps
    end
    add_index :pageview_counters, :url
  end

  def self.down
    drop_table :pageview_counters
  end
end

