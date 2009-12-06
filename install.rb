require 'fileutils'

puts "Installing pageviews..."
source = File.join(File.dirname(__FILE__), 'migrate')
target = File.join(RAILS_ROOT, 'db/migrate')
timestamp = Time.now.strftime('%Y%m%d%H%M%S')
FileUtils.cp(File.join(source, '_create_pageviews.rb'), File.join(target, "#{Time.now.strftime('%Y%m%d%H%M')}01_create_pageviews.rb"))
FileUtils.cp(File.join(source, '_create_pageview_counters.rb'), File.join(target, "#{Time.now.strftime('%Y%m%d%H%M')}02_create_pageview_counters.rb"))

puts %{Plugin installed.
Next steps:

  1) Run rake db:migrate to create the trackable table in your database
  
  2) Add the tracking code to whichever controllers you want to track, 
     and specify the methods you want to include or exclude. 
      
     For example:
  
        def HomeController < ActionController
          track_pageviews :except => [:admin]
          ...

        def ArticlesController < ActionController
          track_pageviews :only => [:show]
          ...
}