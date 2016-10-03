class ContactGroup < ActiveRecord::Base
  validates :group_id, :contact_id, presence: true
  validates_uniqueness_of :group_id, scope: :contact_id

  belongs_to :group
  belongs_to :contact
end
