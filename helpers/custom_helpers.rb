module CustomHelpers
  def aside_partial_path(name)
    prefix = 'sections/aside_sections/'
    postfix = '_aside_section'
    "#{prefix}#{name}#{postfix}"
  end
end
