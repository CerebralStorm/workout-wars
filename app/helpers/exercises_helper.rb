module ExercisesHelper
  def table_header(exercise)
    content = content_tag(:tr, nil)
    exercise.fields.each do |field|
      content << content_tag(:th, field.to_s.titleize)
    end
    content
  end
end
