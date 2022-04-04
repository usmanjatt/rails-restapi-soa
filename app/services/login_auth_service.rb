class LoginAuthService < ApplicationService

    attr_reader :params
  
      def initialize(params)
        @params = params
      end
    
      def call

        print @params

        options = { :identity =>  @params[:identity],
                    :password =>  @params[:password]}

        response = HTTParty.post("https://eclipse-java-sandbox.ukheshe.rocks/eclipse-conductor/rest/v1/authentication/login", 
                                body: options.to_json,
                                headers: {'Content-Type' => 'application/json'})                  

        response
      end

end