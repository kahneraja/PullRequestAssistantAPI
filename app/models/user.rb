class User < ApplicationRecord

  # validations
  validates_presence_of :github_id, :github_token

end
