module Sorenson
  module Services
    class Flag < Base
      def self.all(order = nil)
        url = "/flags#{"?order="+order if order}"
        get_from(url)
      end

      def self.count
        get_from("/accounts/#{account_id}/flags/count")["count"]
      end
    end
  end
end
