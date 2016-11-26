module Sorenson
  module Services
    class Subaccount < Base

      # Attributes
      attr_accessor :account, :id, :username, :status, :accountId, :email, :dateRetrieved

      # Class Methods

      # Instance Methods

      def initialize(account, data)
        self.account                  = account
        self.username                 = data['username']
        self.id                       = data['id']
        self.status                   = data['status']
        self.accountId                = data['accountId']
        self.email                    = data['email']
        self.dateRetrieved            = data['dateRetrieved']
      end

      def activate!
        Base.put_to("/subaccounts/#{id}/activate")
      end

      def deactivate!
        Base.put_to("/subaccounts/#{id}/deactivate")
      end

    end
  end
end
