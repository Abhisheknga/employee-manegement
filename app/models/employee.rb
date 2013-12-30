class Employee < ActiveRecord::Base
  belongs_to :department
  validates :name, presence: true
  validates :post, presence: true
  validates :salery, numericality: true
  validates :department_id, presence: true
end
