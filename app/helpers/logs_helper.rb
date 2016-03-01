module LogsHelper
  def status_id_maker(id)
    "status-" + id.to_s
  end

  def status_css_maker(log)
    if log.processed?
      "glyphicon glyphicon-ok status_processed"
    else
      "status_not_processed"
    end
  end

  def checkbox_glyph_chooser(checkbox_value)
    if checkbox_value == 0
      '<span class="glyphicon glyphicon-remove"></span>'.html_safe
    else
      '<span class="glyphicon glyphicon-ok"></span>'.html_safe
    end
  end
end
