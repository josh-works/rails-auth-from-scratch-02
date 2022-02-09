Re-doing Steve's `rails authentication from scratch` tutorial: https://stevepolito.design/blog/rails-authentication-from-scratch/

My first time through, I recorded all of my notes here: https://github.com/josh-works/rails-authentication-from-scratch/tree/main

This time I'm using Tailwind, so I'm going to see how styling things goes, and I might eventually try to deploy this thing so I can get real emails.

I like the flexibility I can have with rolling my own authentication, and I want to be able to do it skillfully.

For practice, I'm planning deviating from the tutorial in small ways and large, to reinforce my mental models of how it's all working.

## step 0: 

```
rails new rails-auth-from-scratch-02 -d postgresql --css=tailwind
```


## Step 1: Build User Model

```
rails g model RegularUser email:string nickname:string first_name:string last_name:string
rails g migration  add_avatar_to_regular_users avatar:string // add one more string column to RegularUser for an avatar
```

```ruby
# regular_user.rb
class RegularUser < ApplicationRecord
  before_save :set_nickname
  
  private 
  def set_nickname
    self.nickname = "#{first_name} #{last_name}"
  end
end
```

```ruby
# seeds.rb
5.times do |n|
  RegularUser.find_or_create_by(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: Faker::Avatar.image(size: "50x50", format: "jpg")
  )
end
```

```
b rails db:create
b rails db:migrate
b rails db:seed
```