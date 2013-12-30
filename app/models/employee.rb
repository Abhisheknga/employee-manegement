class Employee < ActiveRecord::Base
  belongs_to :department
  validates :salery, numericality: true
  validates :department_id, presence: true
  def self.search(search)
    if search
      where 'name LIKE ? OR post LIKE ?', "%#{search}%","%#{search}"
      # Employee.joins(:departments).where('post LIKE ? OR departments.name LIKE ?', "%#{search}%","%#{search}%")
    else
      scoped
    end
  end
end