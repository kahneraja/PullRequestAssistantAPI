class User < ApplicationRecord

  has_one :org, dependent: :destroy

end
