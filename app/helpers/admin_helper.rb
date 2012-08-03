module AdminHelper

  def select_alert_type(name, message)
    if !!(/^Place.*/ =~ message)
      return 'info'
    elsif name == :notice
      return 'success'
    else
      return 'error'
    end 
  end

end
