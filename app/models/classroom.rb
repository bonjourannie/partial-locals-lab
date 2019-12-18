# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  course_name :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classroom < ActiveRecord::Base
  has_many :classroom_students
  has_many :students, through: :classroom_students

  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%")
    else
      self.all
    end
  end
end
