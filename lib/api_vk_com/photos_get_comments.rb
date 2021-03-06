module ApiVkCom
  class PhotosGetComments < VkMethod
    @method_name = 'photos.getComments'
    PARAMS = { 'count' => 100 }

    def self.exec(params)
      user_ids, attempt = [], 0

      # comments_info = get_comments_list(params)
      # count = comments_info.first.to_i
      # comments = comments_info.drop(1)
      # user_ids.concat(comments.map{|c| c['from_id']})
      # until user_ids.size >= count
      #   sleep 0.2
      #   comments = get_comments_list(params, attempt += 1).drop(1)
      #   user_ids.concat(comments.map{|c| c['from_id']})
      # end
      # user_ids.uniq
      get_comments_list(params)
    rescue => e
      puts e
      nil
    end

    private

    def self.get_comments_list(params, offset = 0)
      params.merge!('offset' => offset * 100)
      # JSON.parse(send_request(params.merge(PARAMS)).body)['response']
      send_request(params.merge(PARAMS)).body
    end

  end
end