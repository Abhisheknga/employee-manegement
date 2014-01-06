class Department < ActiveRecord::Base
  has_many :employees, dependent: :destroy
  validates :name, length: {minimum: 5}

  before_validation :normalize_name, on: [:create,:update]
  before_create :capitalize_task
  # after_validation :set_location, on: [ :create, :update ]

  protected
  def normalize_name
    self.name = self.name.downcase.titleize
  end

  def capitalize_task
    self.task = self.task.split.map(&:capitalize).join(' ')
  end

  # def set_location
    # self.location = LocationService.query(self)
  # end
end