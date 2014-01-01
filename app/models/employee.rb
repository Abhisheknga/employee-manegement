class Employee < ActiveRecord::Base
  belongs_to :department
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[a-z]/
  end
  validates :post, inclusion: { in: %w(SE JSE SSE DEV MANAGER se jse sse dev manager Manager),message: "%{value} is not valid, SE JSE SSE DEV MANAGER are available post" }
  validates :email, uniqueness: true, confirmation: true, :presence => true, :email => true
  validates :email_confirmation, presence: true
  validates :salery, numericality: true
  validates :department_id, presence: true
  def self.search(search)
    if search
      # where 'name LIKE ? OR post LIKE ?', "%#{search}%","%#{search}"
      Employee.joins(:department).where('employees.name LIKE ? OR departments.name LIKE ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end