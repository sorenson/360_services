module Sorenson
  module Services
    class Metric < Base
      def self.all(offset = nil, quantity = nil)
        get_from("/metrics").collect do |event|
          Event.new(event)
        end
      end

      def self.total_plays
        get_from("/metrics/total_plays")['total_plays'].to_i
      end

      def self.storage_used(start_date = nil, end_date = nil)
        options = {}
        options.merge(:start_date => start_date, :end_date => end_date) if start_date && end_date
        get_from("/metrics/storage", options)['storage_used']
      end
    end
  end
end