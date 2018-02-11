class User < ApplicationRecord

  # validations
  validates_presence_of :github_token, :slack_token

end
