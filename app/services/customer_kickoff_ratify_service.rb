class CustomerKickoffRatifyService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call
        puts "<Add Customer Kickoff Ratify Service>"
        
        print params['token']

        joken = "Bearer " + params['token']

        options = { 

                  }

        response = HTTParty.post("#{ENV['baseUrl']}rest/v1/tenants/#{params['tenantId']}/customers/#{params['consumerCustomerId']}/ratify",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end