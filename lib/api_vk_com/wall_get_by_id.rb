class WallGetById < VkMethod
	@method_name = 'wall.getById'

	def self.exec(params)
		get_post_by_id(params).first
	rescue => e
		puts e
		nil
	end

	private

	def self.get_post_by_id(params)
		JSON.parse(send_request(my_vk_name, params).body)['response']
	end

end