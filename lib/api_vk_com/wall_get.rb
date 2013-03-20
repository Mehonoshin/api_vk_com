module ApiVkCom
  class WallGet < VkMethod
    @method_name = 'wall.get'
    COUNT = 30
    PARAMS = { 'filter' => 'owner' }

    def self.exec(params)
      posts, attempt = [], 0
      count = params[:count].to_i || COUNT
      params.merge!('count' => count)

      response = get_wall_posts(params).drop(1)
      posts.concat(response)
      until posts.size >= count || response.empty?
        sleep 0.2
        response = get_wall_posts(params, attempt += 1).drop(1)
        posts.concat(response)
      end
      posts
    rescue => e
      puts e
      nil
    end

    private

    def self.get_wall_posts(params, offset = 0)
      params.merge!('offset' => offset * 100)
      JSON.parse(send_request(params.merge(PARAMS)).body)['response']
    end

  end
end