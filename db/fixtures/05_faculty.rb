source_faculties = SourceFaculty.all
source_faculties.each_with_index do |sf, i|
  Faculty.seed do |d|
    d.id = i
    d.school_id = 0
    d.source_faculty_id = sf.id
    d.name = "立教大学#{sf.name}"
  end
end
