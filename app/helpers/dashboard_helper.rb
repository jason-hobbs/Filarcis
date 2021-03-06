module DashboardHelper
  def nested_folders(folders)
    folders.map do |folder, sub_folders|
      if folder.has_children?
        content_tag(:div, link_to(image_tag("/images/arrow-closed.png", {:size=>"15" }), "#", :class => "arrow") + link_to(image_tag("basic-folder-icon2.svg", {:size=>"25" }), project_contents_path(folder), remote: true, :class => "highlight") + link_to("#{folder.name}<br>".html_safe, project_contents_path(folder), remote: true, id: "folder_name"), :class => "folder-nav", :id => folder.id) + content_tag(:div, nested_folders(sub_folders), :class => "nested_folders")
      else
        content_tag(:div, link_to(image_tag("spacer.png", {:size=>"15" }), project_contents_path(folder), remote: true) + link_to(image_tag("basic-folder-icon2.svg", {:size=>"25" }), project_contents_path(folder), remote: true) + link_to("#{folder.name}<br>".html_safe, project_contents_path(folder), remote: true, id: "folder_name"), :class => "folder-nav", :id => folder.id) + content_tag(:div, nested_folders(sub_folders), :class => "nested_folders")
      end
    end.join.html_safe
  end
end
