module ApiVkCom
  class FriendsGet < VkMethod
    @method_name = 'friends.get'

    def self.exec(params)
      JSON.parse(send_request(params).body)['response']
    end

  end
end