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
      '<td class="service_table_check_row red">
        <span class="glyphicon glyphicon-remove"></span></td>'.html_safe
    else
      '<td class="service_table_check_row green">
        <span class="glyphicon glyphicon-ok"></span></td>'.html_safe
    end
  end
end
