class CustomerCreateWalletService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call
        puts "<Customer Create Wallet Service>"
        
        print params['token']

        joken = "Bearer " + params['token']

        options = { 
                    :name => @params[:name],
                    :externalUniqueId => @params[:externalUniqueId],
                    :walletTypeId => @params[:walletTypeId],
                    :status => @params[:status],
                    :currency => @params[:currency]
                  }

        response = HTTParty.post("#{ENV['baseUrl']}rest/v1/tenants/#{params['tenantId']}/customers/#{params['consumerCustomerId']}/wallets",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end