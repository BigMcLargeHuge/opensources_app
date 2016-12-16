namespace :json_import do
	desc "TODO"

	task import: :environment do
		puts "Im in!"
		File.open("lib/data.json") do |file|
			puts "File Open"
			@data = JSON.parse(file.read)
			puts @data
			@data.each do |f|
				if f[1]["initials_date"].empty?
					if Submission.where(domain: f[0]).exists?
						puts "#{f[0]} exists in database"
						thewebiste = Submission.find_by(domain: f[0])
						unless thewebsite.tags.where(tag_text: f[1]["type"]).exists? || f[1]["type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["type"], submission: thewebsite)
						end
						unless thewebsite.tags.where(tag_text: f[1]["2nd type"]).exists? || f[1]["2nd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["2nd type"], submission: thewebsite)
						end
						unless thewebsite.tags.where(tag_text: f[1]["3rd type"]).exists? || f[1]["3rd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["3rd type"], submission: thewebsite)
						end
					else
						thewebsite = Submission.create(domain: f[0], notes: f[1]["source_notes"])
						unless f[1]["type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["type"], submission: thewebsite)
						end
						unless f[1]["2nd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["2nd type"], submission: thewebsite)
						end
						unless f[1]["3rd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["3rd type"], submission: thewebsite)
						end
					end
				else
					puts "not empty"
					if Website.where(domain: f[0]).exists?
						puts "#{f[0]} exists in database"
						thewebiste = Website.find_by(domain: f[0])
						unless thewebsite.tags.where(tag_text: f[1]["type"]).exists? || f[1]["type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["type"], website: thewebsite)
						end
						unless thewebsite.tags.where(tag_text: f[1]["2nd type"]).exists? || f[1]["2nd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["2nd type"], website: thewebsite)
						end
						unless thewebsite.tags.where(tag_text: f[1]["3rd type"]).exists? || f[1]["3rd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["3rd type"], website: thewebsite)
						end
					else
						thewebsite = Website.create(domain: f[0], notes: f[1]["source_notes"])
						unless f[1]["type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["type"], website: thewebsite)
						end
						unless f[1]["2nd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["2nd type"], website: thewebsite)
						end
						unless f[1]["3rd type"].empty?
							puts "adding tag"
							Tag.create(tag_text: f[1]["3rd type"], website: thewebsite)
						end
					end
				end
			end
		end
	end
end
