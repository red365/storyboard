class User < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  belongs_to :organisation
end
