class Comment < ActiveRecord::Base
  validates :comment, presence: true

  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User

  belongs_to :commentable, polymorphic: true
end
