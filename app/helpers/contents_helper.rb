module ContentsHelper
  def file_type(content, controller)
    if controller == 'search'
      classname = 'content_name_search small-9 medium-5 large-5'
    else
      classname = 'content_name small-8 medium-9 large-6'
    end
    image = icon(content)
    if content.public
      image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(content.project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}) + image_tag("share.png", :style => "margin-left: 5px;", :size => "15", :title => "Shared") , :class => classname)
    else
      image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(content.project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => classname)
    end
    #image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(content.project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => classname)
  end

  def file_image(content)
    image = icon(content)
    if content.public
      if image.include?('dmg') || image.include?('zip')  || image.include?('exe') || image.include?('default2') || image.include?('doc')
        content_tag(:div, image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, best_in_place(content, :name, :url => project_content_path(@project,content), :class => "input_field"), :class => "file_name"), :class => "fileopen_row") + content_tag(:div, "Share link:") + text_field(:share, :url, :value => "#{request.host}/projects/#{@project.id}/contents/download_file?content=#{content.id}", :readonly => "readonly", :size => 50) + link_to("Download File", download_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("Unshare", share_project_contents_path(:content => content.id), :remote => true, :class => 'button tiny radius space')
      else
        content_tag(:div, image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, best_in_place(content, :name, :url => project_content_path(@project,content), :class => "input_field"), :class => "file_name"), :class => "fileopen_row") + content_tag(:div, "Share link:") + text_field(:share, :url, :value => "#{request.host}/projects/#{@project.id}/contents/download_file?content=#{content.id}", :readonly => "readonly", :size => 50) + link_to("Download File", download_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("View File", view_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("Unshare", share_project_contents_path(:content => content.id), :remote => true, :class => 'button tiny radius space')
      end
    else
      if image.include?('dmg') || image.include?('zip') || image.include?('exe') || image.include?('default2') || image.include?('doc')
        content_tag(:div, image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, best_in_place(content, :name, :url => project_content_path(@project,content), :class => "input_field"), :class => "file_name"), :class => "fileopen_row") + link_to("Download File", download_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("Share", share_project_contents_path(:content => content.id), :remote => true, :class => 'button tiny radius space')
      else
        content_tag(:div, image_tag(image, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, best_in_place(content, :name, :url => project_content_path(@project,content), :class => "input_field"), :class => "file_name"), :class => "fileopen_row") + link_to("Download File", download_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("View File", view_file_project_contents_path(:content => content.id), :class => 'button tiny radius space', :target => "_blank") + link_to("Share", share_project_contents_path(:content => content.id), :remote => true, :class => 'button tiny radius space')
      end
    end
  end


  def icon(content)
    case content.content_type
      when /^image/
        image = content.location.url(:thumb).to_s
      when /pdf/
        image = "pdf3.png"
      when /msword/
        image = "doc.png"
      when /x-apple-diskimage/
        image = "dmg.png"
      when /zip/
        image = "zip.png"
      when /x-msdos-program/
        image = "exe.png"
      when /officedocument.spreadsheetml.sheet/
        image = "xls.png"
      else
        image = "default2.png"
    end
  end
end
