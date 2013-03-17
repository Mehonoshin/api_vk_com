module ApiVkCom
  class GroupsIsMember < VkMethod
    @method_name = 'groups.isMember'

    def self.exec(params)
      res = JSON.parse(send_request(params).body)
      res['response'].blank? ? nil : (res['response'].to_i == 1)
    end

  end
end