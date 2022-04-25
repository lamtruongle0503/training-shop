Category.create!(name: "Quan")
Category.create!(name: "Ao")
Category.create!(name: "Giay")
Category.create!(name: "Dep")
99.times do |n|
    name = Faker::Name.name
    code = "#{n+1}"
    price = "#{(n+1)*100}"
    description = Faker::Lorem.sentence(5)
    if n%4 == 1
      category = "1"
    end

    if n%4 == 2
      category = "2"
    end

    if n%4 == 3
      category = "3"
    end

    if n%4 == 0
      category = "4" 
    end
       
    Product.create!(name: name,
      code: code,
      price: price,
      description: description,
      category_ids: category)
end

99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end

