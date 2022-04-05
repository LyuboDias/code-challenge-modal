class Invitation < ApplicationRecord
    belongs_to :cycle

    # using build in URI constant to validate email
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid format!" } 
    validates :message, length: { maximum: 200,
        too_long: "%{count} characters maximum!" }
end
