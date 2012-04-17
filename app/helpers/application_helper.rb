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

  def russian_upcase(string)
    string.mb_chars.upcase.to_s
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
  
  def photo_uploadify(url, parent)
    datatype = 'photo[image]'
    session_key_name = Rails.application.config.session_options[:key]
    %Q{
    <script type='text/javascript'>
        $('#photo_upload').uploadify({
          script          : '#{raw(url)}',
          fileDataName    : '#{datatype}',
          uploader        : '/assets/uploadify/uploadify.swf',
          cancelImg       : '/assets/uploadify/cancel.png',
          fileDesc        : 'Images',
          fileExt         : '*.png;*.jpg;*.gif',
          sizeLimit       : #{10.megabytes},
          queueSizeLimit  : 24,
          multi           : true,
          auto            : true,
          buttonText      : 'Add photo',
          buttonImg       : '/assets/admin/addphoto.png',
          width           : 202,
          height          : 42,
          scriptData      : {
            '_http_accept': 'application/javascript',
            '#{session_key_name}' : encodeURIComponent('#{u(cookies[session_key_name])}'),
            'authenticity_token'  : encodeURIComponent('#{u(form_authenticity_token)}'),
            'auth_token' : "#{current_user.authentication_token}",
            'class' : '#{parent.try(:class).try(:name)}',
            'idr' : '#{parent.try(:id)}'
          },
          onComplete      : function(a, b, c, response){ eval(response); },
          onError : function (a, b, c, d) {
           if (d.status == 404)
              alert('Could not find upload script. Use a path relative to: '+'<?= getcwd() ?>');
           else if (d.type === "HTTP")
              console.log(d);
           else if (d.type ==="File Size")
              alert(c.name+' '+d.type+' Limit: '+Math.round(d.sizeLimit/1024)+'KB');
           else
              alert('error '+d.type+": "+d.text);
          }
        });
    </script>

    }.gsub(/[\n ]+/, ' ').strip.html_safe
  end

  def photo_sortable(url)
    html = %Q{
      <script type="text/javascript">
        $(document).ready(function() {
          $("#photo-list").each(function(){
            var self = $(this);
            self.sortable({
              dropOnEmpty: false,
              cursor: 'crosshair',
              opacity: 0.75,
              items: 'li',
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
