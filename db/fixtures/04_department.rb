source_departments = SourceDepartment.all
source_departments.each_with_index do |sd, i|
  Department.seed do |d|
    d.id = i
    d.school_id = 0
    d.source_department_id = sd.id
    d.name = "立教大学#{sd.name}"
  end
end
