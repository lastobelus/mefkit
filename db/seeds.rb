# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

############################################################################
# LastObelus Consulting setup
############################################################################

pw = SecureRandom.hex(32)

root_email = ENV.fetch("ROOT_ADMIN_EMAIL")
admin = Admin.where(email: root_email).first
admin ||= Admin.create(
  email: root_email,
  password: pw,
  password_confirmation: pw,
)
token = admin.send_reset_password_instructions
puts "http://localhost:3000/admins/password/edit?reset_password_token=#{token}"
