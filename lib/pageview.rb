class Pageview < ActiveRecord::Base

  before_save :count
  
  def self.make(controller, request, response)
    _pageview = Pageview.create(
      :url => path(request.url),
      :controller_name => controller.class.name,
      :action_name => controller.action_name,
      :http_method => request.method.to_s,
      :status_code => response.status,
      :remote_ip => request.remote_ip,
      :referrer => path(request.referrer)
    )
    logger.info "### #{_pageview.to_s}"
  end

  def self.path(url)
    "/#{url.split('/')[3..-1] * '/'}"
  end
    
  def count
    PageviewCounter.count(self)
  end

  def to_s   
    "#{Time.zone.now.to_s}	#{http_method}	#{url}	#{controller_name}	#{action_name}	#{status_code}	#{remote_ip}	#{referrer}"
  end
  
end
