module StudentsHelper

  def show_checkmark
    if @student.triennial == true
      content_tag(:i, '', class: 'fi-check')
    else
      content_tag(:i, '', class: 'fi-prohibited')
    end
  end

  def dismissed_checkmark
    if @student.dismissed == true
      content_tag(:i, '', class: 'fi-check')
    else
      content_tag(:i, '')
    end
  end
end
