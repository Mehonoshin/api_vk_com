module ApiVkCom
  class GetCities < VkMethod
    @method_name = 'getCities'

    def self.exec(params)
      JSON.parse(send_request(params).body)['response']
    end

  end
end