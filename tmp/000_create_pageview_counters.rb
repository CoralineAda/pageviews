class CreatePageviewCounters < ActiveRecord::Migration
  def self.up
    create_table :pageview_counters, :id => false do |t|
      t.string url
      t.string controller_name
      t.string action_name
      t.string http_method
      t.string status_code
      t.integer views, :default => 0
      t.timestamps
    end
    add_index :pageviews, :url
  end

  def self.down
    drop_table :pageview_counters
  end
end
