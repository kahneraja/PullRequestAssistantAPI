class Org < ApplicationRecord

  belongs_to :user

  has_many :contributor, dependent: :destroy

end
