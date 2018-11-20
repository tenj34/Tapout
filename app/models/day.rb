class Day < ActiveRecord::Base
  belongs_to :user

  validates :month, :date, :year, presence: true
end
