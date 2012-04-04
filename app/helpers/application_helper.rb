# coding:utf-8
module ApplicationHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => :del)
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end
  
	def current_path(path)
  	"current" if current_page?(path)
	end

	def sortable(url)
    html = %Q{
      <script type="text/javascript">
        $(document).ready(function() {
          $("table.sortable").each(function(){
            var self = $(this);
            self.sortable({
              dropOnEmpty: false,
              cursor: 'crosshair',
              opacity: 0.75,
              handle: '.handle',
              axis: 'y',
              items: 'tr',
              scroll: true,
              update: function() {
                $.ajax({
                  type: 'post',
                  data: self.sortable('serialize') + '&authenticity_token=#{u(form_authenticity_token)}',
                  dataType: 'script',
                  url: '#{url}'
                })
              }
            });            
          });
        });
      </script>
    }.gsub(/[\n ]+/, ' ').strip.html_safe
    return content_for(:js,html)
  end 
end
