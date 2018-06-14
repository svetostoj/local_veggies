module ApplicationHelper
    def google_keys()
        if Rails.env.production?
          "key=#{ENV.fetch('MAPS_KEYJS')}&"
        else
          ''
        end
      end
end
