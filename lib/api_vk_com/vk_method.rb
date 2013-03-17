require 'net/http'
require 'net/https'

module ApiVkCom
  class VkMethod
    attr_accessor :method_name
    @method_name = nil

    class << self
      def my_vk_name
        @method_name
      end

      def send_request(params, use_ssl = true)
        full_url = ['http', use_ssl ? 's' : '', '://api.vk.com/method/', my_vk_name].join
        uri = URI.parse(full_url)
        req = Net::HTTP::Post.new(uri.path)
        req.set_form_data(params)
        session = Net::HTTP.new(uri.hostname, use_ssl ? 443 : 80)
        session.use_ssl = use_ssl
        res = session.start do |http|
          http.request(req)
        end
      end
    end
  end
end