class SyncTokenGenerator
  def self.generate_code
    SecureRandom.hex
  end
end
