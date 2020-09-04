class ApplicationController < ActionController::API
    
    def encode_token(payload)
        # byebug
        JWT.encode(payload, Rails.application.credentials.jwt[:key])
    end

    def logged_in?

        headers = request.headers["Authorization"]
        jwt = headers.split(" ")[1]

        begin
            user = User.find(JWT.decode(jwt, Rails.application.credentials.jwt[:key]))
        rescue
            user = nil
        end
        render json: {error: "Please Login"} unless user
    end

end
