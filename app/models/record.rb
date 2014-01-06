class Record < ActiveRecord::Base
  validates :title, presence: true,length: { minimum: 4 }
  validates :priority, numericality: true
  validate :due_date_cannot_be_in_the_past
  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if
    !due_date.blank? and due_date < Date.today
  end

end