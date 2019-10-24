# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


require 'faker'

def seed_city

	City.destroy_all

	100.times do

		City.create!(name: Faker::Address.city)

	end

end

def seed_doctor

	Doctor.destroy_all

	first_city = City.first.id
	last_city = City.last.id

	100.times do

		c = City.find(rand(first_city..last_city)) 
		Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: c)

	end

end

def seed_patient

	Patient.destroy_all

	first_city = City.first.id
	last_city = City.last.id

	100.times do
		
		c = City.find(rand(first_city..last_city)) 
		Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: c)

	end

end

def seed_appointment

	Appointment.destroy_all

	first_doctor = Doctor.first.id
	last_doctor = Doctor.last.id

	first_patient = Patient.first.id
	last_patient = Patient.last.id

	first_city = City.first.id
	last_city = City.last.id


	100.times do
		
		d = Doctor.find(rand(first_doctor..last_doctor)) 
		p = Patient.find(rand(first_patient..last_patient)) 
		c = City.find(rand(first_city..last_city)) 
		Appointment.create!(date: Faker::Date.forward(days: 1200), doctor: d, patient: p, city: c)

	end

end

def seed_specialty

	Specialty.destroy_all

	specialties_array = ["Allergy and immunology","Anesthesiology", "Cardiology", "Clinical neurophysiology", "Dermatology", "Endocrinology", "Gastroenterology", "Hematology", "Medical genetics", "Medical oncology", "Neonatology", "Nephrology", "Nuclear medicine", "Ophthalmology"]


	specialties_array.each do |spe|

		Specialty.create(name: spe)

	end
	

end

def seed_title

	
	
	first_doctor = Doctor.first.id
	last_doctor = Doctor.last.id

	first_specialty = Specialty.first.id
	last_specialty = Specialty.last.id

	100.times do
		
		d = Doctor.find(rand(first_doctor..last_doctor)) 
		s = Specialty.find(rand(first_specialty..last_specialty))

		Title.create!(doctor: d, specialty: s)

	end
end 

def perform 

	seed_city
	seed_doctor
  seed_patient
	seed_appointment
	seed_specialty
	seed_title
	
end

perform