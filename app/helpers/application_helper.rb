module ApplicationHelper

  FLASH_ALERT_MAPPING = {
    notice: 'success',
    alert: 'danger'
  }.freeze

  def get_mapping(symbol)
    FLASH_ALERT_MAPPING[symbol.to_sym].tap do |value|
      puts "GOT #{value} FROM #{symbol}"
    end
  end

  def page_title(title = '')
    base_title = "Reddit"

    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end

end
