require 'uuid'

class Badge < ApplicationRecord
  validates_presence_of :uuid
  validates_presence_of :recipient_name
  validates_presence_of :badge_issue_date
  validate :validate_uuid

  def validate_uuid
    errors.add(:uuid, 'UUID is not valid') unless UUID.validate(uuid)
  end
end
