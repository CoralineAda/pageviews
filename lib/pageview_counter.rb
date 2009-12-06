class PageviewCounter < ActiveRecord::Base

  def self.count(pageview)
    counter = PageviewCounter.find_or_create_by_url_and_http_method(
      :url => pageview.url,
      :http_method => pageview.http_method,
      :controller_name => pageview.controller_name,
      :action_name => pageview.action_name,
      :status_code => pageview.status_code
    )
    counter.update_attribute(:views, counter.views + 1)
  end
  
end
