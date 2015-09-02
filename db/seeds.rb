# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	course_type = [
		["Links", "The original links courses, which are mostly found in the U.K., were situated in the thin strip of sand, grass and dunes that lay between the sea and agricultural land. The courses 'linked' them together. Links style courses will have undulating fairways, sand dunes, deep bunkers and few (if any) trees. Many of the most famous links courses are to be found in Scotland or Ireland, including St Andrews, Turnberry, Portmarnock and Ballybunion."],
		["Parkland", "The most common style of golf course can be found in the U.S. On a parkland course you will find lush, well-kept fairways, mature trees, thick rough and bunkers. They are usually situated well inland, although some very fine courses can be found close to the coastlines."],
		["Resort", "Resort courses are very common in vacation states like Florida. Owned and run by hotels or resort companies, these courses are designed to be a pleasure to play for their guests regardless of the standard of golf they play. This means they will typically have wide fairways and the rough will be cut fairly short. This also helps speed of play on what are often very heavily played courses. These courses often have wide fairways. Visually many of these courses provide stunning surroundings, with mature trees, lakes, and large, shallow sand traps."],
		["Heath-Land", "Heath-land courses are inland courses that feature gentle, rolling fairways winding through a landscape full of bushes and shrubs but few large trees. Some of the oldest courses in the U.K., including past Ryder Cup venues like Walton Heath, are this style of course."],
		["Desert", "These are mostly found in the southwestern U.S. Situated in deserts and therefore watered heavily, they are oases of green in the middle of the sand. Usually desert courses are pretty flat due to the nature of the country they are found in. Many of the best feature lakes, huge sandy waste areas surrounding the fairways, and large, sloping greens. A typical landscape of sand, cacti, palm trees and rocky outcrops give a very distinctive feel to these courses."]
	]

	course_type.each do |name, description|
		CourseType.create( name: name, description: description )
	end
