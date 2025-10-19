class BlacklistedToken < ApplicationRecord
  # This uses the same blacklisted_tokens table from user service
  self.table_name = 'blacklisted_tokens'

  def self.cleanup
    where('exp < ?', Time.current).delete_all
  end

  def self.blacklisted?(jti)
    exists?(jti: jti)
  end
end
