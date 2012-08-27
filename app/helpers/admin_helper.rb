module AdminHelper

  def select_alert_type(name, message)
    if !!(/^Place.*/ =~ message)
      # No need of 'return' at all
      'info'
    elsif name == :notice
      'success'
    else
      'error'
    end
  end

end
