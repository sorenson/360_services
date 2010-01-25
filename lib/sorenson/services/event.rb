module Sorenson
  module Services
    class Event < Base
      attr_accessor :date, :account_id, :value, :type, :day, :id, :last_modified, :retreived_on
      def initialize(data)
        @date           = Date.parse(data['eventDate'])
        @day            = Date.parse(data['eventDay'])
        @last_modified  = Date.parse(data['dateLastModified'])
        @retreived_on   = Date.parse(data['dateRetrieved'])
        @id             = data['id']
        @account_id     = data['accountId']
        @value          = data['eventIntegerValue'] || data['eventDecimalValue'] || data['eventStringValue']
        @type           = data['eventType']
        
         # {"eventDate"=>"2009-12-17 20:31:40", 
         #  "accountId"=>"db786013-c786-4511-8a0d-73f1bacc2285", 
         #  "eventIntegerValue"=>292684, 
         #  "eventType"=>"storageAdd", 
         #  "eventDay"=>"2009-12-17", 
         #  "eventDecimalValue"=>nil, 
         #  "id"=>"80437d46-f704-4fbc-8e61-0e9467a60b05", 
         #  "dateLastModified"=>"2009-12-17 20:31:40", 
         #  "eventStringValue"=>nil, 
         #  "dateRetrieved"=>"2009-12-30 13:16:18"}
      end
    end
  end
end