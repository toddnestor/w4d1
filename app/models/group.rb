class Group < ActiveRecord::Base
  validates :name, :user_id, presence: true

  belongs_to :user

  has_many :contact_groups

  has_many :contacts,
    through: :contact_groups,
    source: :contact
end
