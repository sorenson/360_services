module Sorenson
  module Services
    class RatePlan < Base
      attr_accessor :display_name, :rate_plan_type, :max_thumbnails_per_video, :setup_cost, :monthly_cost, :annual_cost, :allowed_streams, :base_plan,
                    :date_last_modified, :date_retrieved, :streaming_overage_allowed, :storage_overage_allowed, :allowed_streaming_megabytes,     
                    :allowed_storage_megabytes, :allowed_source_media_types, :allowed_output_media_types, :sorenson_sku, :data               
      
      def initialize(data)
        @display_name                = data['display_name']
        @rate_plan_type              = data['rate_plan_type']
        @max_thumbnails_per_video    = data['max_thumbnails_per_video']
        @setup_cost                  = data['setup_cost']
        @monthly_cost                = data['monthly_cost']
        @annual_cost                 = data['annual_cost']
        @allowed_streams             = data['allowed_streams']
        @base_plan                   = data['base_plan']
        @date_last_modified          = data['date_last_modified']
        @date_retrieved              = data['date_retrieved']
        @streaming_overage_allowed   = data['streaming_overage_allowed']
        @storage_overage_allowed     = data['storage_overage_allowed']
        @allowed_streaming_megabytes = data['allowed_streaming_megabytes']
        @allowed_storage_megabytes   = data['allowed_storage_megabytes']
        @allowed_source_media_types  = data['allowed_source_media_types'].collect {|e| e['mediaType']}
        @allowed_output_media_types  = data['allowed_output_media_types'].collect {|e| e['mediaType']}
        @sorenson_sku                = data['sorenson_sku']
        @data = data
      end
    end
  end
end