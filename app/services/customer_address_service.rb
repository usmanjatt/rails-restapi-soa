class CustomerAddressService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end

      def call
        puts "<Add Customer Address Service>"

        joken = "Bearer " + params['token']

        options = { :addressType => @params[:addressType],
                    :city => @params[:city],
                    :country => @params[:country],
                    :line1 => @params[:line1],
                    :line2 => @params[:line2],
                    :state => @params[:state],
                    :code => @params[:code]
                  }

        response = HTTParty.post("#{ENV['baseUrl']}rest/v1/tenants/#{params['tenantId']}/customers/#{params['consumerCustomerId']}/addresses",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end