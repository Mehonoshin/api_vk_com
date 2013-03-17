module ApiVkCom
  class UsersGet < VkMethod
    @method_name = 'users.get'
    PARAMS = { 'fields' => 'uid, first_name, last_name, screen_name, sex, bdate, city, country, photo, photo_big, has_mobile' }

    def self.exec(params)
      get_user_info(params).first
    rescue => e
      puts e
      nil
    end

    private

    def self.get_user_info(params)
      params.merge!(PARAMS) if params.exclude?(:fields)
      JSON.parse(send_request(params).body)['response']
    end

  end
end