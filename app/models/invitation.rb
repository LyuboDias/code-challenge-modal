class Invitation < ApplicationRecord
    belongs_to :cycle

    validates_presence_of :email
    # using build in URI constant to validate email
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :message, length: { maximum: 200,
        too_long: "%{count} characters maximum!" }
end