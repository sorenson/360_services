# Sorenson Namespace
module Sorenson
  # Sorenson Services Namespace
  module Services
    # Allows you to access the resources associated with a sorenson services asset.  An asset currently refers to video content.
    class Preset < Base
      def self.all
        get_from('/presets')
      end
      
      def self.find_by_name(name)
        response = get_from("/presets/#{URI.encode(name)}")
        if response.has_key?(:errors)
          nil
        else
          response['url']
        end
      end
    end
  end
end