module ContentsHelper
  def file_type(content)
     case content.content_type
       when /^image/
         content_tag(:div, image_tag(content.location.url(:thumb).to_s) + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /pdf/
         content_tag(:div, image_tag("pdf3.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /msword/
         content_tag(:div, image_tag("doc.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /x-apple-diskimage/
         content_tag(:div, image_tag("dmg.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /zip/
         content_tag(:div, image_tag("zip.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /x-msdos-program/
         content_tag(:div, image_tag("exe.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       when /officedocument.spreadsheetml.sheet/
         content_tag(:div, image_tag("xls.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
       else
         content_tag(:div, image_tag("default2.png") + link_to(content.name, project_content_path(@project, content)), :class => "content_name")
     end
  end
end
