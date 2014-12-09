module ContentsHelper
  def file_type(content)
     case content.content_type
       when /^image/
         image_tag(content.location.url(:thumb).to_s, :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /pdf/
         image_tag("pdf3.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /msword/
         image_tag("doc.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /x-apple-diskimage/
         image_tag("dmg.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /zip/
         image_tag("zip.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /x-msdos-program/
         image_tag("exe.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /officedocument.spreadsheetml.sheet/
         image_tag("xls.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       else
         image_tag("default2.png", :style => 'float:left;') + content_tag(:div, link_to(content.name, project_content_path(@project, content)), :class => "content_name")
     end
  end
end
