class RegisterCustomerService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call
        puts "<Register Customer Service>"
        
        joken = "Bearer " + params['token']

        options = { :dateOfBirth => @params[:dateOfBirth],
                    :email => @params[:email],
                    :externalUniqueId => @params[:externalUniqueId],
                    :firstName => @params[:firstName],
                    :lastName => @params[:lastName],
                    :locale => @params[:locale],
                    :phone1 => @params[:phone1],
                    :status => @params[:status],
                    :gender => @params[:gender],
                    :maritalStatus => @params[:maritalStatus],
                    :birthCountry => @params[:birthCountry],
                    :birthCity => @params[:birthCity],
                    :nationalIdentityNumber => @params[:nationalIdentityNumber],
                    :title => @params[:title]
                  }

        response = HTTParty.post("https://eclipse-java-sandbox.ukheshe.rocks/eclipse-conductor/rest/v1/tenants/#{params['tenantId']}/customers",
                                    body: options.to_json,
                                    headers: {'Content-Type' => 'application/json',
                                              'Authorization' => joken}
                                  )                  
        pp response
      
        response
      end

end