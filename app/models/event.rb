class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: 'User'
    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }, inclusion: { in: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120] }
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
    validates :location, presence: true 

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < Time.now
          errors.add(:start_date, "can't be in the past")
        end
    end

end
