class LikesGetList < VkMethod
	@method_name = 'likes.getList'
	PARAMS = { 'count' => 1000 }

	def self.exec(params)
		user_ids, attempt = [], 0

		response = get_users_list(params)
		count = response['count'].to_i
		user_ids.concat(response['users'])
		until user_ids.size >= count
			sleep 0.2
			response = get_users_list(params, attempt += 1)
			user_ids.concat(response['users']).uniq!
		end
		user_ids
	rescue => e
		puts e
		nil
	end

	private

	def self.get_users_list(params, offset = 0)
		params.merge!('offset' => offset * 1000)
		JSON.parse(send_request(params.merge(PARAMS)).body)['response']
	end

end