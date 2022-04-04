class Api::V1::Authentication::AuthenticationController < ApplicationController

    def create
        
        response = LoginAuthService.call(params)

        render json: response
    end

end
