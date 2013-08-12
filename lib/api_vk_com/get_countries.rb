module ApiVkCom
  class GetCountries < VkMethod
    @method_name = 'getCountries'

    def self.exec(params)
      JSON.parse(send_request(params).body)['response']
    end

  end
end