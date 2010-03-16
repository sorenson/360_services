module Sorenson
  module Services
    class InvalidServerResponse < Exception
    end
    
    class Invalid360ServiceSetup < Exception
    end
    
    class InvalidSiteId < Exception
    end
    
    class Base
      cattr_accessor :account_id, :account_token

      def self.verify_account_settings
        if @@account_id.blank? || @@account_token.blank?
          raise Invalid360ServiceSetup.new("You must specify an account_id and account_token before using 360 services")
        end        
      end
            
      def self.login_no_resource(username, password)
        RestClient.post(host + "/sessions", :username => username, :password => password).body
      end

      def self.host
        host = ['development', 'test', 'cucumber'].include?(RAILS_ENV)  ? 'http://localhost:3001' : 'http://360services.sorensonmedia.com' 
        host
      end

      def self.post_to(url, payload = {})
        verify_account_settings
        post_to_url  = host + url
        client       = RestClient::Resource.new(post_to_url, :user => account_id, :password => account_token)
        
        parse_response(client.post(payload))
      end
      
      def self.get_from(url, payload = {})
        verify_account_settings
        get_from_url = host + url + "?#{payload.to_query}"
        client       = RestClient::Resource.new(get_from_url, :user => account_id, :password => account_token)
        
        parse_response(client.get)
      end
      
      def self.put_to(url, payload = {})
        verify_account_settings
        put_to_url = host + url
        client     = RestClient::Resource.new(put_to_url, :user => account_id, :password => account_token)
        
        parse_response(client.put(payload))
      end
      
      def self.delete_from(url)
        verify_account_settings
        delete_from_url = host + url
        client          = RestClient::Resource.new(delete_from_url, :user => account_id, :password => account_token)
        
        parse_response(client.delete)
      end
      
      def self.parse_response(response)
        begin
          JSON.parse(response.body)
        rescue JSON::ParserError => e
          raise InvalidServerResponse.new("Sorenson::Services::InvalidServerResponse: #{e.message}")
        end
      end
    end
  end
end