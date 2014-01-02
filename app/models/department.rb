class Department < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  validates :name, length: {minimum: 5}
end
