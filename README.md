# ApiVkCom

Gem for some methods of vk.com API.

## Installation

Add this line to your application's Gemfile:

    gem 'api_vk_com'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_vk_com

## Usage

After installing the gem you can call some vk.com API methods like this:

    ApiVkCom.exec(<original_method_name>, <params_hash>)

For example:

    ApiVkCom.exec('users.get', {:uids => params['uid'], :access_token => params['access_token']})

It's return information about single user. By default response will be contains hash with keys: uid, first_name, last_name, screen_name, sex, bdate, city, country, photo, photo_big, has_mobile. Also you can pass param 'fields' in ApiVkCom.exec request with custom values.

    ApiVkCom.exec('likes.getList', {:owner_id => params['owner_id'], :item_id => params['item_id'], :type => 'photo', :access_token => params['access_token']})

This request return you array of vk_ids. etc...

Every method describe in separate class, that provides you to extend gem abilities and methods list.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
