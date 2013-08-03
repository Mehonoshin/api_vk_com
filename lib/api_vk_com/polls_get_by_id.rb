module ApiVkCom
  class PollsGetById < VkMethod
    @method_name = 'polls.getById'

    def self.exec(params)
      # .first
      get_poll_by_id(params)
    rescue => e
      puts e
      nil
    end

    private

    def self.get_poll_by_id(params)
      # ['response']
      JSON.parse(send_request(params).body)
    end

  end
end