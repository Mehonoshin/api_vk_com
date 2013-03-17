class PhotosGetComments < VkMethod
	@method_name = 'photos.getComments'
	PARAMS = { 'count' => 100 }

	def self.exec(params)
		# user_ids, attempt = [], 0
		# 
		# comments_info = get_comments_list(params)
		# count = comments_info.first.to_i
		# comments = comments_info.drop(1)
		# user_ids.concat(comments.map{|c| c['from_id']})
		# until user_ids.size >= count
		# 	comments = get_comments_list(params, attempt += 1).drop(1)
		# 	user_ids.concat(comments.map{|c| c['from_id']})
		# end
		# user_ids.uniq
		JSON.parse(VkMethod.send_request(@@api_url + @method_name, params.merge(PARAMS)).body)
	rescue
		puts e
		nil
	end

	private

	def self.get_comments_list(params, offset = 0)
		params.merge!('offset' => offset * 100)
		JSON.parse(send_request(my_vk_name, params.merge(PARAMS)).body)['response']
	end

end