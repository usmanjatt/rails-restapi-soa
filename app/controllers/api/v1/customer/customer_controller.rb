class Api::V1::Customer::CustomerController < ApplicationController

    def create

        case
            when params['service_name'] == "Create_Customer"
                response = RegisterCustomerService.call(params)
                
            when params['service_name'] == "Add_Address_Details"
                response =CustomerAddressService.call(params)
           
            when params['service_name'] == "Add_KYC_Doc_info"
                response = CustomerKycDocService.call(params)
                
            when params['service_name'] == "Kick_off_Ratify"
                response = CustomerKickoffRatifyService.call(params)

            when params['service_name'] == "Create_Wallet"
                response = CustomerCreateWalletService.call(params)
        
            else
                response = "service name not valid"
        end

        render json: response.body
    end

end