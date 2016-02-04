module ProgramsHelper
  def expand_collapse_for(chef_resource)
    render html: ExpandCollapse.new(chef_resource).html
  end

  class ExpandCollapse
    def initialize(chef_resource)
      @chef_resource = chef_resource
    end

    def html
      case @chef_resource.resource_type
      when "Repository"
        repository
      when "Deb"
        deb
      when "Source"
        source
      when "Download"
        download
      when "Extract"
        extract
      end
    end

    def repository
      str_temp = ""
      @chef_resource.chef_properties.each do |property|
        str_temp += "<div class='form-group'>"
        str_temp += "  <label for='name'>"
        str_temp += "    Name:"
        str_temp += "  </label>"
        str_temp += "  <div class='input-group'>"
        str_temp += "    <input type='text' name='chef_property_#{property.id}' value='#{property.value}'>"
        str_temp += "  </div>"
        str_temp += "</div>"
      end
      return str_temp.html_safe
    end

    def deb
      str_temp = ""
      @chef_resource.chef_properties.each do |property|
        str_temp += "<div class='form-group'>"
        str_temp += "  <label for='name'>"
        str_temp += "    Name:"
        str_temp += "  </label>"
        str_temp += "  <div class='input-group'>"
        str_temp += "    <input type='text' name='chef_property_#{property.id}' value='#{property.value}'>"
        str_temp += "  </div>"
        str_temp += "</div>"
      end
      return str_temp.html_safe
    end

    def source
      str_temp = ""
      @chef_resource.chef_properties.each do |property|
        str_temp += "<div class='form-group'>"
        str_temp += "  <label for='name'>"
        str_temp += "    Name:"
        str_temp += "  </label>"
        str_temp += "  <div class='input-group'>"
        str_temp += "    <input type='text' name='chef_property_#{property.id}' value='#{property.value}'>"
        str_temp += "  </div>"
        str_temp += "</div>"
      end
      return str_temp.html_safe
    end

    def download
      str_temp = ""
      @chef_resource.chef_properties.each do |property|
        if property.value_type == "name"
          str_temp += "<div class='form-group'>"
          str_temp += "  <label for='name'>"
          str_temp += "    Name:"
          str_temp += "  </label>"
          str_temp += "  <div class='input-group'>"
          str_temp += "    <textarea type='text' name='chef_property_#{property.id}' >#{property.value}</textarea>"
          str_temp += "  </div>"
          str_temp += "</div>"
        else #file_path
          str_temp += "<div class='form-group'>"
          str_temp += "  <label for='name'>"
          str_temp += "    File path:"
          str_temp += "  </label>"
          str_temp += "  <div class='input-group'>"
          str_temp += "    <input type='text' name='chef_property_#{property.id}' value='#{property.value}'>"
          str_temp += "  </div>"
          str_temp += "</div>"
        end
      end
      return str_temp.html_safe
    end

    def extract
      str_temp = ""
      @chef_resource.chef_properties.each do |property|
        if property.value_type == "source"
          str_temp += "<div class='form-group'>"
          str_temp += "  <label for='name'>"
          str_temp += "    Source:"
          str_temp += "  </label>"
          str_temp += "  <div class='input-group'>"
          str_temp += "    <input type='text' name='chef_property_#{property.id}' value='#{property.value}'>"
          str_temp += "  </div>"
          str_temp += "</div>"
        else #destination
          str_temp += "<div class='form-group'>"
          str_temp += "  <label for='name'>"
          str_temp += "    Destination:"
          str_temp += "  </label>"
          str_temp += "  <div class='input-group'>"
          str_temp += "    <textarea type='text' name='chef_property_#{property.id}' >#{property.value}</textarea>"
          str_temp += "  </div>"
          str_temp += "</div>"
        end
      end
      return str_temp.html_safe
    end
  end

end
