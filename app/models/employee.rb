class Employee < ActiveRecord::Base
  belongs_to :department
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
    else
      scoped
    end
  end
end
>>>>>>> d23902d781f23deeabd8c5eabec3a8d605f44d8b
