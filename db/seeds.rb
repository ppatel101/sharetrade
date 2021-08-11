# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin
Admin.create(email: "admin@gmail.com", password: "123456")

#Organization
org = Organization.create(name: "organation1", domain: "domain1")

#organization_admin
Admin.create(email: "admin1@gmail.com", password: "123456", name: "admin1", organization_id: org.id)

#organization_user
user1 = User.create(email: "user1@gmail.com", password: "123456", name: "user1", organization_id: org.id)
user2 = User.create(email: "user2@gmail.com", password: "org.id23456", name: "user2", organization_id: org.id)

#organization_system
System.create(name: "system1",description: "system description 1",purchase_date: Date.today, warranty_month: 2, user_id: user1.id, organization_id: org.id)
System.create(name: "system2",description: "system description 2",purchase_date: Date.today, warranty_month: 2, user_id: user2.id, organization_id: org.id)

#organazation_notification
Notification.create(title: "Notification1", description: "Notification description 1", organization_id: org.id)

#organization_project
# For user1
project = Project.new(name: "project1",organization_id: org.id)
project.user_ids = user1.id
project.save
# For user2
project = Project.new(name: "project2",organization_id: org.id)
project.user_ids = user2.id
project.save

#User side : LeaveApplication
#For user1
LeaveApplication.create(subject: "Leave subject1", description: "Leave description 1", from_date: Date.today, to_date: Date.today + 2, user_id: user1.id, organization_id: org.id)
#For user2
LeaveApplication.create(subject: "Leave subject2", description: "Leave description 1", from_date: Date.today, to_date: Date.today + 2, user_id: user2.id, organization_id: org.id)

#User side : DailyUpdate
#For user1
DailyUpdate.create(description: "Daily Update Description1", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user1.id, organization_id: org.id)
#For user2
DailyUpdate.create(description: "Daily Update Description2", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user2.id, organization_id: org.id)