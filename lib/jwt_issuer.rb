require "jwt"

class JwtIssuer
  EXPIRE_TIME = 60 * 60 * 24 # 24 hours

  class << self
    def encode(user_id)
      # exp = Integer Time.now + EXPIRE_TIME

      # payload = {
      #   user_id: user_id,
      #   env: ENV["ENV"] || "local",
      #   exp: exp,
      # }

      # JWT.encode(payload, rsa_private, "RS256")
      "sample-jwt-#{user_id}"
    end

    def decode(jwt)
      id = jwt.to_s.sub("sample-jwt-", "")

      {
        user_id: id,
      }
    end
  end
end
