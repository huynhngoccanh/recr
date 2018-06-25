#class StatObserver < ActiveRecord::Observer
  #def after_create(stat)
    #return false unless stat.last_modified_by_id
    #users = notifiable_users(stat)
    #users.each do |user_to_notify|
      #Notification.create(recipient_id: user_to_notify.id,
                          #actor_id: stat.last_modified_by_id,
                          #notifiable: stat,
                          #action: "has added their stats for #{stat.position.abbreviation} #{stat.position.season}")
    #end
  #end

  #def after_update(stat)
    #return false unless stat.last_modified_by_id
    #users = notifiable_users(stat)
    #users.each do |user_to_notify|
      #Notification.create(recipient_id: user_to_notify.id,
                          #actor_id: stat.last_modified_by_id,
                          #notifiable: stat,
                          #action: "has updated their stats for #{stat.position.abbreviation} #{stat.position.season}")
    #end
  #end

  #private
    #def notifiable_users(stat)
      #stat.athlete.high_school.coach_users if stat.athlete.high_school.present?
    #end
#end
