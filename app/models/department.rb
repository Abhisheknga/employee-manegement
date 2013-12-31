class Department < ActiveRecord::Base
  has_many :employees, dependent: :destroy
<<<<<<< HEAD
  validates :name, presence: true, length: {minimum: 5}
  validates :task, presence: true
  validates :location, presence: true
=======
  validates :name, length: {minimum: 5}
>>>>>>> b53bec187dedaf125278d3c31d962686c6e347eb
end
