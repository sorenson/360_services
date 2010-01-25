module Sorenson
  module Services
    class Tag < Base      
      def self.all(order = nil)
        get_from("/tags#{"?order="+order if order}")
      end
      
      def self.find(tag_name)
        get_from("/tags/#{tag_name}")
      end
      
      def self.count
        get_from("/accounts/#{account_id}/tags/count")["count"]
      end
    end
  end
end