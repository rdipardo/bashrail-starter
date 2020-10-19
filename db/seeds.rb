require 'faker'

## Prepare `Product#new` and `#edit` views
1.upto(10) do |i|
  CountryOfOrigin.create name: Faker::Address.country, ctype: i.to_s,
                         fdate: Time.now, active_status: 1, sort_order: 1 + i
end

# populate `pColor` selection box (from colours joined on `pcolor` field)
1.upto(10) do |i|
  Pfeature.create name: Faker::Commerce.color, fdate: Time.now + 1e6 * i,
                  active_status: 1, sort_order: 1 + i
end

1.upto(10) do |i|
  Product.create name: Faker::Commerce.product_name,
                 pcolor: Pfeature.find_or_initialize_by(id: i).name,
                 pdate: Time.now + 1e6 * i,
                 country_of_origin_id: i,
                 active_status: 1,
                 sort_order: 1 + i
end

# seed `roles` to satisfy integrity constraints
no_super = Role.create name: 'lr_regular',
                       description: 'Can edit data, readonly lookup tables'
admin = Role.create name: 'lr_admin',
                    description: 'Can perform any CRUD operation on any resource'

# seed `users` so new visitors can log in
User.create email: 'a@e', name: 'admin', password: 'a',
            password_confirmation: 'a', role_id: admin.id
User.create email: 'a', name: 'admin', password: 'a',
            password_confirmation: 'a', role_id: admin.id
User.create name: 'reg', email: 'r', password: 'a',
            password_confirmation: 'a', role_id: no_super.id
