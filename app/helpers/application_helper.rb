module ApplicationHelper
	def page_title
		[content_for(:page_title) || content_for(:thredded_page_title),
		t('brand.name')].compact.join(' - ')
	end
end
