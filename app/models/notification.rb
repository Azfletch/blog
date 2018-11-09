class Notification < ApplicationRecord
  validates :name, :email, presence: true
end
