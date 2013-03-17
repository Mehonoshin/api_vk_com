require 'api_vk_com/vk_method'
Dir[File.dirname(__FILE__) + '/api_vk_com/*.rb'].each { |file| require file }

module ApiVkCom

  class << self
    def exec(method, params)
      to_class_name(method).constantize.exec(params)
    end

    def to_class_name(name)
      name = name.camelize
      begin
        if _ind = name.index('.')
          name.slice!(_ind)
          name[_ind] = (name[_ind].ord - 32).chr
        end
      end while _ind
      ['ApiVkCom', name].join('::')
    end
  end

end