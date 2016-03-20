class Student < ActiveRecord::Base
  def fullname
    @fullname = "#{first_name} #{last_name}"
  end

  def self.first_name_asc
    order('first_name asc')
  end

  def self.last_name_asc
    order('last_name: :asc')
  end
end
