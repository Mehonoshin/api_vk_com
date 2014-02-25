module ApiVkCom
  class PollsGetVoters < VkMethod
    @method_name = 'polls.getVoters'

    def self.exec(params)
      # .first
      get_poll_voters(params)
    rescue => e
      puts e
      nil
    end

    private

    def self.get_poll_voters(params)
      # ['response']
      JSON.parse(send_request(params).body)
    end

  end
end
