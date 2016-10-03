class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates_uniqueness_of :email, scope: :user_id

  belongs_to :user

  has_many :contact_shares, dependent: :destroy

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable

  has_many :contact_groups

  has_many :groups,
    through: :contact_groups,
    source: :group
end
