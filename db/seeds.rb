# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cust = Customer.create(name: "John", phone_number: 7775556633, email: "testing@1212.com", password: "password", password_confirmation: "password")

admin = Employee.create(name: "Jane", job_title: "Tester", admin: true, password: "password", password_confirmation: "password", worker_number: 1234)
emp = Employee.create(name: "doe", job_title: "Driver", admin: false, password: "password", password_confirmation: "password", worker_number: 5678)

veh = cust.vehicles.build(make: "Toyota", model: "Supra", miles: 100000, vin: "12345678910111213")

ro = admin.repair_orders.build(vehicle: veh, finished: false, customer: cust)

ro.jobs.build(concern: "oil change", completed: false)