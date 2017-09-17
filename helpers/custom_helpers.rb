module CustomHelpers
  def aside_partial(name)
    "partials/aside/#{name}"
  end

  def website_link(link)
    '<li><i class="fa fa-link"></i><span class="sr-only">Website:</span><a href="#">' + link + '</a></li>'
  end

  def project_partial_path(name)
    "partials/projects/templates/#{name}"
  end

  def social_link_icon service_name, **hash
    link = data.header.method("link_to_profile_on_#{service_name}").call
    target = 'target="' + (hash.key?(:open_in_new_tab) ? '_blank' : '_self') + ';"'
    bg_color = 'style="background: ' + (hash[:bg_color] || 'white') + ';"'
    fg_color = 'style="color: ' + (hash[:fg_color] || 'black') + ';"'
    icon_name = (service_name == 'codewars') ? 'diamond' : service_name
      
    "<a href=\"#{link}\" #{bg_color} #{target}><i class=\"fa fa-#{icon_name}\" aria-hidden=\"true\" #{fg_color}></i></a>"
  end

  def yt_thumbnail_image(link)
    video_id = link.match(/v=(.*)$/)[1]             # truncate youtube link
    video_id.sub!(/\?t.*$/, '')                     # truncate "start from"
    "https://img.youtube.com/vi/#{video_id}/mqdefault.jpg"  # return small thumbnail
  end

end
