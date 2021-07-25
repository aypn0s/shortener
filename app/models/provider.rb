class Provider < ApplicationRecord
  validates :api_token, presence: true, if: :api_token_required?
end
