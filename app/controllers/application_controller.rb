class ApplicationController < ActionController::API
   before_action :authorized

   def encode_token(payload)
            # payload => { beef: 'steak' }
        JWT.encode(payload, 'my_s3cr3t')
    # jwt string: "eyJhbGciOiJIUzI1NiJ9.eyJiZWVmIjoic3RlYWsifQ._IBTHTLGX35ZJWTCcY30tLmwU9arwdpNVxtVU0NpAuI"
   end

   def auth_header
    request.headers['Authorization']
   end
   def decode(token)
    JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
   end

  def decoded_token
        if auth_header
            # token = auth_header.split(' ')[1]
            token = auth_header
            # headers: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
                # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
            rescue JWT::DecodeError
                nil
            end
        end
    end
    def current_user
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
      end

    def logged_in?
        !!current_user
    end
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless !!current_user
    end

end
