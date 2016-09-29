module UUIDHelper
  def self.included(base)
    base.before_create :assign_uuid
  end

  private
  def assign_uuid
    self.id = UUIDTools::UUID.timestamp_create().to_s
    # self.CreateTime = Time.now  if !self.ID.blank?
    # self.UpdateTime = Time.now  if !self.ID.blank?
  end
end
