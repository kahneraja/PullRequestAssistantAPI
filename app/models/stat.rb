class Stat < ApplicationRecord

  has_one :org, dependent: :destroy

end
