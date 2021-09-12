class ChainpointClient
  include HTTParty
  HASH_URL = 'http://3.136.178.15/hashes'.freeze

  def initialize(badge)
    @badge = badge
  end

  def call
    create_badge
  end

  private

  def badge_hash
    Digest::SHA256.hexdigest "#{@badge.badge_issue_date}; #{@badge.recipient_name}; #{@badge.uuid}"
  end

  def create_badge
    body = {"hashes": [badge_hash]}
    HTTParty.post(HASH_URL, body: body.to_json, headers: {'Content-Type' => 'application/json'})
  end
end
