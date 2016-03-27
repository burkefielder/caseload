class Student < ActiveRecord::Base
  has_many :sessions, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def fullname
    @fullname = "#{first_name} #{last_name}"
  end

  def self.first_name_asc
    order('first_name asc')
  end

  def years_old(age)
    now = Time.now.utc.to_date
    now.year - age.year - ((now.month > age.month || (now.month == age.month && now.day >= age.day)) ? 0 : 1)
  end
end
