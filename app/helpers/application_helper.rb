module ApplicationHelper
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
