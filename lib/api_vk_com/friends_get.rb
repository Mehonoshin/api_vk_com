class FriendsGet < VkMethod
	@method_name = 'friends.get'

	def self.exec(params)
		JSON.parse(send_request(my_vk_name, params).body)['response']
	end

end