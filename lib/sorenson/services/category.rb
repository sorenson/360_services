module Sorenson
  module Services
    class Category < Base
      attr_accessor :description, :name, :parent_id, :parent, :id
      def self.all
        get_from("/categories").map{|c| c["name"]}
      end
      
      def self.find_by_name(name)
        data = get_from("/categories/find_by_name", :category => {:name => name})
        return new(data) unless data.nil? || data == ''
        nil
      end
      
      def self.find(id)
        data = get_from("/categories/#{id}")
        return new(data) unless data.nil? || data == ''
      end
            
      def self.create(name, options = {})
        new(post_to("/categories", :category => {:name => name}.merge(options)))
      end
      
      def save
        Base.put_to("/categories/#{id}", :category => {:name => name, :description => description}, :parent_name => parent)
      end
      
      def destroy
        Base.delete_from("/categories/#{id}")["status"]
      end
      
      def assets
        Base.get_from("/categories/#{id}/assets")
      end
      
      def self.all_roots
        Base.get_from("/categories/roots").map{|category| category['name']}
      end
      
      def parent
        parent_id ? Sorenson::Services::Category.find(parent_id).name : @parent
      end
      
      def initialize(data)
        self.description = data['description']
        self.name = data['name']
        self.parent_id = data["parent_id"]
        self.id = data["id"] 
      end
    end
  end
end