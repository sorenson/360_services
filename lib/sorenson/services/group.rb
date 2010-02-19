module Sorenson
  module Services
    class Group < Base
      attr_accessor :name, :description, :account_id, :id, :guid

      def self.create(name, attributes={})
        new(post_to("/groups", :group => attributes.merge(:name => name)))
      end
      
      def self.all
        collection = Base.get_from("/groups")
        collection.collect { |data| new(data['group'])}
      end
      
      def self.find(id)
        data = Base.get_from("/groups/#{id}")
        return new(data['group']) if data['group']
        nil
      end
      
      def self.find_by_name(name)
        data = Base.get_from("/groups/find_by_name", :name => name)
        return new(data['group']) if data['group']
        nil
      end
      
      def add_asset(asset)
        Base.put_to("/groups/#{id}/assets/#{asset.id}")
      end
      
      def add_user(user_id)
        Base.put_to("/groups/#{id}/users/#{user_id}")
      end
      
      def assets
        collection = Base.get_from("/groups/#{id}/assets")
        collection.collect { |data| new(data['asset'] )}
      end
      
      def users
        Base.get_from("/groups/#{id}/users")
      end
      
      def delete
        Base.delete_from("/groups/#{id}")
      end
        
      def initialize(attributes)
        @name        = attributes["name"]
        @description = attributes["description"]
        @account_id  = attributes["account_id"]
        @id          = attributes["guid"]
      end
    end
  end
end