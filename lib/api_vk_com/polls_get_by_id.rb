module ApiVkCom
  class PollsGetById < VkMethod
    @method_name = 'polls.getById'

    def self.exec(params)
      get_poll_by_id(params).first
    rescue => e
      puts e
      nil
    end

    private

    def self.get_poll_by_id(params)
      JSON.parse(send_request(params).body)['response']
    end

  end
end