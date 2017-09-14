module CustomHelpers
  def aside_partial_path(name)
    prefix = 'sections/aside_sections/'
    postfix = '_aside_section'
    "#{prefix}#{name}#{postfix}"
  end

  def website_link(link)
    '<li><i class="fa fa-link"></i><span class="sr-only">Website:</span><a href="#">' + link + '</a></li>'
  end
end
