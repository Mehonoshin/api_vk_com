module ApiVkCom
  class NotesGetComments < VkMethod
    @method_name = 'notes.getComments'
    PARAMS = { 'count' => 100 }

    def self.exec(params)
      user_ids, attempt = [], 0
    
      comments_info = get_comments_list(params)
      count = comments_info.first.to_i
      comments = comments_info.drop(1)
      user_ids.concat(comments.map{|c| c['uid'].to_i})
      until user_ids.size >= count
        sleep 0.2
        comments = get_comments_list(params, attempt += 1).drop(1)
        user_ids.concat(comments.map{|c| c['uid'].to_i})
      end
      user_ids.uniq
    rescue => e
      puts e
      nil
    end

    private

    def self.get_comments_list(params, offset = 0)
      params.merge!('offset' => offset * 100)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end

  end
end