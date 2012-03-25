module ApplicationHelper
	def current_path(path)
  	"current" if current_page?(path)
	end
end
