module DashboardHelper
  def nested_folders(folders)
    folders.map do |folder, sub_folders|
      #folder.name + content_tag(:div, nested_folders(sub_folders), :class => "nested_folders")
      #link_to image_tag("folder2.png", {:size=>"25" }), project_contents_path(folder), remote: true
      #link_to folder.name, project_contents_path(folder), remote: true
      #content_tag(:div, link_to folder.name, project_contents_path(folder), remote: true)


      link_to("#{folder.name}<br>".html_safe, project_contents_path(folder), remote: true) + content_tag(:div, nested_folders(sub_folders), :class => "nested_folders")




    end.join.html_safe
  end
end
