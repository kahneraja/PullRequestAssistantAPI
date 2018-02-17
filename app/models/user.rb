class User < ApplicationRecord

  has_one :org, dependent: :destroy


  # validations
  validates_presence_of :github_id, :github_token

end
