module ApiVkCom
  class GroupsGetMembers < VkMethod
    @method_name = 'groups.getMembers'
    PARAMS = { 'count' => 1000, 'sort' => 'time_desc' }

    def self.exec(params)
      user_ids, attempt = [], 0

      response = get_members_list(params)
      count = response['count'].to_i
      user_ids.concat(response['users'])
      until user_ids.size >= count
        sleep 0.2
        response = get_members_list(params, attempt += 1)
        user_ids.concat(response['users']).uniq!
      end
      user_ids
    rescue => e
      puts e
      nil
    end

    private

    def self.get_members_list(params, offset = 0)
      params.merge!('offset' => offset * 1000)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end

  end
end