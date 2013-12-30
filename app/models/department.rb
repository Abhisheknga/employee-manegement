class Department < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  validates :name, presence: true, length: {minimum: 5}
  validates :task, presence: true
  validates :location, presence: true
end
