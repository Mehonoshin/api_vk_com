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
      response = JSON.parse(send_request(params.merge(PARAMS)).body)
      #raise(ApiVkCom::CaptchaNeeded, "http://api.vk.com/captcha.php?sid=77832259230")
      response['response'] || raise(ApiVkCom::CaptchaNeeded, {captcha_sid: response['error']['captcha_sid'], captcha_img: response['error']['captcha_img']})
    end

  end
end
