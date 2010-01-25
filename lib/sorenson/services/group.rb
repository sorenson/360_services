module Sorenson
  module Services
    class Group < Base
      attr_accessor :name, :description, :account_id, :id, :assets

      def self.create(name, attributes={})
        new(post_to("/groups", :group => attributes.merge(:name => name)))
      end

      def add_asset(asset)
        self.assets = Base.put_to("/groups/#{id}/assets/#{asset.id}")
      end
      
      def self.all
        Base.get_from("/groups")
      end
      
      def self.find(id)
        data = Base.get_from("/groups/#{id}")
        new(data) if data['group']
      end
      
      def self.find_by_name(name)
        data = Base.get_from("/groups/find_by_name", :name => name)
        new(data) if data['group']
      end
      
      def destroy
        Base.delete_from("/groups/#{id}")
      end
        
      def initialize(attributes)
        @name = attributes['group']["name"]
        @description = attributes['group']["description"]
        @account_id = attributes['group']["account_id"]
        @id = attributes['group']["guid"]
        @assets = attributes['group']["asset_ids"]
      end
    end
  end
end