module ApiVkCom
  class GroupsGetById < VkMethod
    @method_name = 'groups.getById'
    PARAMS = { 'fields' => 'name, screen_name, is_closed, is_admin, photo_medium, photo_big' }

    def self.exec(params)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end
  end
end