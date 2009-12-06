module Pageviews

  def self.included(base_class) #:nodoc:#
    base_class.extend(ClassMethods)
    base_class.class_eval do
      include InstanceMethods
    end
  end
  
  module ClassMethods
    def tracks_pageviews #:nodoc:#
      true
    end

    # FIXME docs here
    def track_pageviews(filter_options={})
      after_filter :track_pageview, filter_options
    end
  end

  module InstanceMethods #:nodoc:#
    def track_pageview
      Pageview.make(self, request, response)
    end
  end
  
end
