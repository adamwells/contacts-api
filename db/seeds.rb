User.destroy_all
Contact.destroy_all
ContactShare.destroy_all

User.create!(username: "eric")
User.create!(username: "adam")
User.create!(username: "david")
User.create!(username: "jeff")

Contact.create!(name: "Contact1", email: "1.com", user_id: 1)
Contact.create!(name: "Contact2", email: "2.com", user_id: 2)
Contact.create!(name: "Contact3", email: "3.com", user_id: 3)
Contact.create!(name: "Contact4", email: "4.com", user_id: 3)

ContactShare.create!(user_id: 1, contact_id: 2)
ContactShare.create!(user_id: 1, contact_id: 3)
ContactShare.create!(user_id: 2, contact_id: 1)
ContactShare.create!(user_id: 2, contact_id: 4)
