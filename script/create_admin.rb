name = 'Admin'
email = 'admin@admin.com'
password = 'admin'
admin = User.new
admin.name = name
admin.email = email
admin.password = 'admin'
admin.admin = true
admin.save

puts " * * * "
puts "Admin user created successfully!"
puts "E-mail: " + admin.email + ", Password: " + password
puts " * * * "
