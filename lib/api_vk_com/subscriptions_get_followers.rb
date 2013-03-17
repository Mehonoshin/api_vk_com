module ApiVkCom
  class SubscriptionsGetFollowers < VkMethod
    @method_name = 'subscriptions.getFollowers'
    PARAMS = { 'count' => 1000 }

    def self.exec(params)
      subscriber_ids, attempt = [], 0

      response = get_subscribers_list(params)
      count = response['count'].to_i
      subscriber_ids.concat(response['users'])
      until subscriber_ids.size >= count
        sleep 0.2
        response = get_subscribers_list(params, attempt += 1)
        subscriber_ids.concat(response['users']).uniq!
      end
      subscriber_ids
    rescue => e
      puts e
      nil
    end

    private

    def self.get_subscribers_list(params, offset = 0)
      params.merge!('offset' => offset * 1000)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end

  end
end