namespace :submission_tag do
	desc "TODO"

	task merge: :environment do
		tags = Tag.where("submission_id IS NOT NULL").all
		tags.each do |tag|
			puts "tagid #{tag.id}"
			subid = tag.submission_id
			puts "subid #{subid}"
			sub = Submission.find(subid)

			sub.tag_text = tag.tag_text
			puts "test tag"
			sub.notes = tag.notes
			puts "first"

			tag.destroy
			puts "second"
			sub.save
		end
	end
end
