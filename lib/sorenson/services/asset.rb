  # Sorenson Namespace
module Sorenson
  # Sorenson Services Namespace
  module Services
    # Allows you to access the resources associated with a sorenson services asset.  An asset currently refers to video content.
    class Asset < Base
      
      
      attr_accessor :encode_date, :frame_rate, :height, :date_last_modified, :video_bitrate_mode, 
                    :media_type, :id, :account_id, :number_of_views, :application, :audio_codec, 
                    :permalink_location, :status, :description, :video_duration, :abstract_file_id, :version_id,
                    :date_retrieved, :audio_data_rate, :audio_bitrate_mode, :video_codec, :display_name, :name,
                    :video_data_rate, :author_id, :width, :file_size, :thumbnail_image_url, :direct_asset_url, 
                    :password, :metadata, :embed_list, :group_id, :video_guid, :streaming_server_and_video_path
      
      # Get all of the assets as a list of guids.  Use offset and quantity to return subsets.
      #   Sorenson::Services::Account.login('username', 'password')
      #   assets = Sorenson::Services::Asset.all
      #   names  = assets.collect {|asset| asset.name}
      #   => names = ["name1", "name2"]
      def self.all(offset = nil, quantity = nil)
        list = get_from("/assets", :offset => offset, :quantity => quantity)["asset_list"]
        list.collect {|a| new(a) }
      end
      
      # Get a list of asset guids by passing a tag name
      def self.find_all_by_tag(tag_name)
        get_from("/tags/#{tag_name}/assets", :account_id => account_id)
      end
      
      def self.find_all_by_flag(flag_name)
        get_from("/flags/#{flag_name}/assets", :account_id => account_id)
      end
      
      def tags
        Base.get_from("/assets/#{id}/tags")
      end
      
      def self.count
        Base.get_from("/assets/count")["count"]
      end
                
      def self.find(id)
        data = get_from("/assets/#{id}")
        return nil if data[:status].eql?('invalid asset id')
        new(data)
      end
      
      def preset_xml
        Base.get_from("/assets/#{id}/preset_xml")["preset_xml"]
      end
      
      def deactivate
        Base.post_to("/assets/#{id}/deactivate")["status"]
      end
      
      def activate
        Base.post_to("/assets/#{id}/activate")["status"]
      end
      
      def destroy
        Base.delete_from("/assets/#{id}")["status"]
      end
      
      def save(attributes={})
        Base.put_to("/assets/#{id}", :asset => {:name => name, :password => password, :description => description}.merge(attributes))
      end
      
      def add_category(name)
        Category.new(Base.post_to("/assets/#{id}/categories", :category => {:name => name}))
      end
      
      def remove_category
        category = self.category
        return true if category.nil?
        Base.delete_from("/assets/#{id}/categories/#{category.id}")
      end
      
      def category
        data = Base.get_from("/assets/#{id}/categories")
        return nil if data["result"] == 'failure'
        Category.new(data)
      end
      
      def embed_codes
        Base.get_from("/assets/#{id}/embed_codes")['embed_codes']
      end
      
      def add_tags(tags)
        Base.post_to("/assets/#{id}/tags", { :tag_list => tags })
      end
      
      def flags
        Base.get_from("/assets/#{id}/flags")
      end
      
      def add_flags(flags)
        Base.post_to("/assets/#{id}/flags", {:flag_list => flags})
      end
      
      def delete_metadata(key)
        Base.delete_from("/assets/#{id}/metadata/#{key}")[:status]
      end
      
      def get_metadata_value(key)
        data = Base.get_from("/assets/#{id}/metadata/#{key}")
        return nil if data["status"] == 404
        data["result"]
      end
      
      def set_metadata(key, value)
        data = Base.post_to("/assets/#{id}/metadata", {:key => key, :value => value})
      end
      
      def metadata
        Base.get_from("/assets/#{id}/metadata")
      end
      
      def group
        return nil if @group_id.nil?
        Group.new(Base.get_from("/groups/#{group_id}")['group'])
      end
      
      def add_group(group)
        data = Base.put_to("/groups/#{group.id}/assets/#{id}")
        if data['status'].eql?('Success')
          @group_id = group.id
        else
          data['status']
        end
      end
      
      def streaming_server_and_video_path
        data = Base.get_from("/videos/#{id}/streaming_url")
        if data['status'].eql?("not found")
          nil
        else
           data
        end
      end
      
      def initialize(data)
        @encode_date         = data['encode_date']
        @frame_rate          = data['frame_rate']
        @height              = data['height']
        @date_last_modified  = data['date_last_modified']
        @video_bitrate_mode  = data['video_bitrate_mode']
        @media_type          = data['media_type']
        @id                  = data['id']
        @account_id          = data['account_id']
        @number_of_views     = data['number_of_views']
        @application         = data['application']
        @audio_codec         = data['audio_codec']
        @permalink_location  = data['permalink_location']
        @status              = data['status']
        @description         = data['description']
        @video_duration      = data['video_duration']
        @abstract_file_id    = data['abstract_file_id']
        @version_id          = data['version_id']
        @date_retrieved      = data['date_retrieved']
        @audio_data_rate     = data['audio_data_rate']
        @audio_bitrate_mode  = data['audio_bitrate_mode']
        @video_codec         = data['video_codec']
        @display_name        = data['display_name']
        @name                = data['name']
        @video_data_rate     = data['video_data_rate']
        @author_id           = data['author_id']
        @width               = data['width']
        @file_size           = data['file_size']
        @thumbnail_image_url = data['thumbnail_image_url']
        @direct_asset_url    = data['direct_asset_url']
        @group_id            = data['group_id']
        @embed_list          = data['embed_list']
        @video_guid          = @embed_list.empty? ? nil : @embed_list.to_a.first[1].match(/videoGUID=(.*?)&/)[1]
      end
    end
  end
end