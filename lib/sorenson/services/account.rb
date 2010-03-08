module Sorenson
  module Services
    class Account < Base
      attr_accessor :rate_plan, :username, :status, :customer_id, :id, :rate_plan_expiration_date, :date_last_modified, 
                    :last_login_time, :date_retrieved, :total_asset_count, :token, :subaccount_id
      cattr_accessor :account_token, :account_id
      
      def self.login(username, password)
        data = JSON.parse(login_no_resource(username, password))
        account = Account.new(data)
        self.account_token  = account.token
        self.account_id     = account.id
        return account if account.token
      end
      
      # Get Accout
      def self.get_account
        new(get_from("/accounts/#{account_id}"))
      end
      
      def rate_plan
        RatePlan.new(Base.get_from("/accounts/#{account_id}/rate_plan"))
      end
      
      def overage_action
        Base.get_from("/accounts/#{account_id}/overage_action")["overage_action"]
      end
      
      def set_password(password, old_password)
        Base.put_to("/accounts/#{account_id}", :account => {:password => password, :old_password => old_password})[:status]
      end
      
      def empty_trash
        Base.post_to("/accounts/#{account_id}/empty_trash")['status']
      end
      
      def get_subaccounts
        get_from("/subaccounts")
      end
      
      def create_subaccount(username, email, password)
        Base.post_to("/subaccounts", :subaccount => {:username => username, :email => email, :password => password})
      end
      
      def initialize(data)
        self.username                  = data['username']
        self.status                    = data['status']
        self.customer_id               = data['id']
        self.id                        = data['id']
        self.subaccount_id             = data['subaccountId']
        self.rate_plan_expiration_date = data['rate_plan_expiration_date']
        self.date_last_modified        = data['date_last_modified']
        self.last_login_time           = data['last_login_time']
        self.date_retrieved            = data['date_retrieved']
        self.total_asset_count         = data['total_asset_count']
        self.token                     = data['token']
        self.id                        = data['account_id'] if data['account_id']
      end
    end
  end
end