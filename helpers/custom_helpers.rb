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



  def start(time)
    # time is in format: _h_m_s or _m_s or _s
    hours, minutes, seconds = 0, 0, 0

    hours = time.match(/(\d+)h/)[1] if time.include? 'h'
    minutes = time.match(/(\d+)m/)[1] if time.include? 'm'
    seconds = time.match(/(\d+)s/)[1] if time.include? 's'

    hours.to_i * 3600 + minutes.to_i * 60 + seconds.to_i
  end



  def yt_video_id(link)
    # truncate id + (optional) start time
    video_id = link.match(/v=(.*)$/)[1]             
    seconds = 0

    # if video_id contains start time, then convert it to seconds (yt embeded player requires that format)
    if extracted_start_time = video_id.match(/\?t=(.*)$/)
      seconds = start(extracted_start_time[1])
    end

    # remove old _h_m_s format
    video_id = video_id.sub(/\?t=(.*)$/, '')

    # append seconds to every link (if not specified seconds = 0)
    video_id += "?start=#{seconds}&"
  end

  def yt_thumbnail_image(link)
    # unused, may not work
    "https://img.youtube.com/vi/#{yt_video_id(link)}/mqdefault.jpg"  # return small thumbnail
  end

  def yt_iframe(link)
    # returns html iframe with youtube player
    # it uses nocookie -> it always starts at the same "start time" or 0s if not specified
    div = '<div class="embed-responsive embed-responsive-16by9">PLACE_FOR_IFRAME</div>'
    source = "https://www.youtube-nocookie.com/embed/#{yt_video_id(link)}rel=0&amp;showinfo=0"
    iframe = '<iframe class="embed-responsive-item" PLACE_FOR_SOURCE frameborder="0" allowfullscreen></iframe>'

    # merge components
    iframe.gsub! /PLACE_FOR_SOURCE/, "src=\"#{source}\""
    div = div.gsub /PLACE_FOR_IFRAME/, iframe
  end
end
