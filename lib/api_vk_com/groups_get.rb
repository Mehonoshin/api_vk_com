module ApiVkCom
  class GroupsGet < VkMethod
    @method_name = 'groups.get'
    PARAMS = { 'count' => 1000 }

    def self.exec(params)
      groups, attempt = [], 0

      response = get_groups(params).drop(1)
      groups.concat(response)
      until response.blank?
        sleep 0.2
        response = get_groups(params, attempt += 1).drop(1)
        groups.concat(response)
      end
      groups
    rescue => e
      puts e
      nil
    end

    private

    def self.get_groups(params, offset = 0)
      params.merge!('offset' => offset * 1000)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end

  end
end