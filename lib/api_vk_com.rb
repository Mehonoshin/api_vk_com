require 'api_vk_com/version'
require 'net/http'
require 'net/https'

module ApiVkCom
	class VkMethod
		attr_accessor :method_name
		@method_name = nil

		class << self
			def send_request(vk_method, params, use_ssl = true)
				full_url = ['http', use_ssl ? 's' : '', '://api.vk.com/method/', vk_method].join
				uri = URI.parse(full_url)
				req = Net::HTTP::Post.new(uri.path)
				req.set_form_data(params)
				session = Net::HTTP.new(uri.hostname, use_ssl ? 443 : 80)
				session.use_ssl = use_ssl
				res = session.start do |http|
					http.request(req)
				end
			end

			def my_vk_name
				@method_name
			end

			def exec(params)
				to_class_name(my_vk_name).constantize.exec(params)
			end

			def to_class_name(name)
				name = name.camelize
				begin
					if _ind = name.index('.')
						name.slice!(_ind)
						name[_ind] = (name[_ind].ord - 32).chr
					end
				end while _ind
				name
			end
		end
	end
end