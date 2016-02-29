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
end
