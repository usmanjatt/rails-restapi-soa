class CustomerWalletTopupService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call
        puts "<Add Wallet Topup>"
        
        joken = "Bearer " + params['token']

        options = { 
                    :amount => @params[:amount],
                    :externalUniqueId => @params[:externalUniqueId],
                    :callbackUrl => @params[:callbackUrl],
                    :landingUrl => @params[:landingUrl],
                    :topupCardData => {
                      :accountType => @params[:topupCardData][:accountType],
                      :cardholderName => @params[:topupCardData][:cardholderName],
                      :expiry => @params[:topupCardData][:expiry],
                      :pan => @params[:topupCardData][:pan],
                      :alias => @params[:topupCardData][:alias],
                      :cvv => @params[:topupCardData][:cvv],
                      :dob => @params[:topupCardData][:dob]
                    },
                    :topupData => @params[:topupData],
                    :type => @params[:type]
                  }

        response = HTTParty.post("#{ENV['baseUrl']}rest/v1/tenants/#{params['tenantId']}/wallets/#{params['consumerWalletId']}/topups",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end