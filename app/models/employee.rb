class Employee < ActiveRecord::Base
  belongs_to :department
<<<<<<< HEAD
  validates :name, presence: true
  validates :post, presence: true
  validates :salery, numericality: true
  validates :department_id, presence: true
<<<<<<< HEAD
end
=======
  def self.search(search)
    if search
      where 'name LIKE ?', "%#{search}%"
=======
  validates :salery, numericality: true
  validates :department_id, presence: true
  def self.search(search)
    if search
      where 'name LIKE ? OR post LIKE ?', "%#{search}%","%#{search}"
      # Employee.joins(:departments).where('post LIKE ? OR departments.name LIKE ?', "%#{search}%","%#{search}%")
>>>>>>> b53bec187dedaf125278d3c31d962686c6e347eb
    else
      scoped
    end
  end
<<<<<<< HEAD
end
>>>>>>> d23902d781f23deeabd8c5eabec3a8d605f44d8b
=======
end
>>>>>>> b53bec187dedaf125278d3c31d962686c6e347eb
