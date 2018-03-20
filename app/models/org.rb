class Org < ApplicationRecord

  belongs_to :user

  has_many :contributor, dependent: :destroy
  has_many :stat, dependent: :destroy
  has_many :audit_messages, dependent: :destroy

end
