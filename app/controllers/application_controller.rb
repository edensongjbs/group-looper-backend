class ApplicationController < ActionController::API
    
    def encode_token(payload)
        # byebug
        JWT.encode(payload, Rails.application.credentials.jwt[:key])
    end

    def current_user
        headers = request.headers["Authorization"]
        jwt = headers.split(" ")[1]
        user = User.find(JWT.decode(jwt, Rails.application.credentials.jwt[:key])[0]["user_id"])
    end

    def logged_in?

        headers = request.headers["Authorization"]
        jwt = headers.split(" ")[1]
        # byebug
        begin
            user = User.find(JWT.decode(jwt, Rails.application.credentials.jwt[:key])[0]["user_id"])
        rescue
            user = nil
        end
        render json: {error: "Please Login"} unless user
    end

end
