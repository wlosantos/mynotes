class Note < ApplicationRecord
  belongs_to :user

  has_enumeration_for :priority, with: Priority, create_helpers: true

  validates :title, presence: true
  validates :content, presence: true
  validates :priority, presence: true
end
