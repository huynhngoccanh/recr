json.array! @notifications do |notification|
	json.id 				notification.id
	json.notifier 	notification.notifier
	json.action			notification.action
	json.notifiable	do
		json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	end
	# json.url high_school_path(notification.notifiable.high_school, anchor: dom_id(notification.notifiable))
end
