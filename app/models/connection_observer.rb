#class ConnectionObserver < ActiveRecord::Observer
  #def after_create(connection)
    #return false unless connection.last_modified_by_id
    #users = notifiable_users(connection)
    #users.each do |user_to_notify|
      #Notification.create(recipient_id: user_to_notify.id,
                          #actor_id: connection.last_modified_by_id,
                          #notifiable: connection,
                          #action: "has created a connection between #{connection.athlete.name} and #{connection.college.name}.")
    #end
  #end

  #def after_update(connection)
    #return false unless connection.last_modified_by_id
    #users = notifiable_users(connection)
    #users.each do |user_to_notify|
      #Notification.create(recipient_id: user_to_notify.id,
                          #actor_id: connection.last_modified_by_id,
                          #notifiable: connection,
                          #action: "has updated the connection between #{connection.athlete.name} and #{connection.college.name}.")
    #end
  #end

  #private
    #def notifiable_users(connection)
      #users = connection.college.coach_users + [connection.athlete.user]
      #users - [connection.last_modified_by]
    #end
#end
