module ContentsHelper
  def file_type(content)
     case content.content_type
       when /^image/
         image_tag(content.location.url(:thumb).to_s, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /pdf/
         #image_tag("pdf3.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
         image_tag("pdf3.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /msword/
         image_tag("doc.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /x-apple-diskimage/
         image_tag("dmg.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /zip/
         image_tag("zip.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /x-msdos-program/
         image_tag("exe.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       when /officedocument.spreadsheetml.sheet/
         image_tag("xls.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
       else
         image_tag("default2.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, link_to(content.name, project_content_path(@project, content), data: {:"reveal-id" => "myModal", :"reveal-ajax" => true}), :class => "content_name")
     end
  end

  def file_image(content)
    case content.content_type
    when /^image/
      image_tag(content.location.url(:thumb).to_s, :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /pdf/
      image_tag("pdf3.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /msword/
      image_tag("doc.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /x-apple-diskimage/
      image_tag("dmg.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /zip/
      image_tag("zip.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /x-msdos-program/
      image_tag("exe.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    when /officedocument.spreadsheetml.sheet/
      image_tag("xls.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    else
      image_tag("default2.png", :style => 'float:left;', :class => "img_preview", :id => content.id) + content_tag(:div, content.name, :class => "file_name")
    end
  end
end
