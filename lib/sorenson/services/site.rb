module Sorenson
  module Services
    class Site < Base
      attr_accessor :name, :account_id, :id, :description
      def self.create(name, options = {})
        new(post_to('/sites', {:site => {:name => name}.merge(options)}))
      end
      
      def self.all
        get_from('/sites')
      end
      
      def Site.find_by_name(name)
        new(get_from('/sites/find_by_name/', :name => name))
      end
      
      def initialize(data)
        @name         = data['name']
        @account_id   = data['account_id']
        @id           = data['id']
        @description  = data['description']
      end
    end
  end
end