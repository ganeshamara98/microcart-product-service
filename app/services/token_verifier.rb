class TokenVerifier
  # Use the 128-byte (256-character) secret key from environment
  SECRET_KEY = Rails.application.credentials.dig(:jwt_secret)

  def self.verify(token)
    decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })[0]
    token_data = HashWithIndifferentAccess.new(decoded)

    # Check if token is blacklisted using the jti
    if BlacklistedToken.blacklisted?(token_data[:jti])
      return nil
    end

    token_data
  rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::VerificationError => e
    nil
  end

  def self.valid?(token)
    verify(token).present?
  end

  def self.user_id(token)
    decoded = verify(token)
    decoded[:user_id] if decoded
  end

  # Extract JTI from token without full validation
  def self.extract_jti(token)
    begin
      decoded = JWT.decode(token, SECRET_KEY, false)[0]
      decoded['jti']
    rescue
      nil
    end
  end
end
