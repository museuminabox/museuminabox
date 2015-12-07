module ApplicationHelper
	def current_link_to label, path = nil, controller = nil
		if controller
	  	link_to label, path, class: (current_page?(controller: controller, action: action_name) ? "active" : nil)
	  else
	  	link_to label, path, class: (current_page?(path) ? "active" : nil)
	  end	  	
	end
end
