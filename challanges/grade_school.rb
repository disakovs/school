# this is a class
class School
  def initialize
    @school = {}
  end

  def to_h
    @school.each { |k, v| @school[k] = v.sort }.sort.to_h
  end

  def add(name, grade_level)
    return @school[grade_level] << name if @school[grade_level]
    @school[grade_level] = [name]
  end

  def grade(level)
    @school[level] || []
  end
end
