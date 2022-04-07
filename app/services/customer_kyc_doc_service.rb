class CustomerKycDocService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call
        puts "<Add Customer KYC Doc Info Service>"
        
        joken = "Bearer " + params['token']

        options = { :documentType => @params[:documentType],
                    :mediaType => @params[:mediaType],
                    :base64EncodedDocument => @params[:base64EncodedDocument]
                  }

        response = HTTParty.post("#{ENV['baseUrl']}rest/v1/tenants/#{params['tenantId']}/customers/#{params['consumerCustomerId']}/documents",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end