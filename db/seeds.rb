if Rails.env.development?
  u = User.create(email: "test@test.de", password: "123", password_confirmation: "123")
  5.times do |i|
    x = u.groups.create(label: "Klasse #{i}")
    5.times do |j|
      x.students.create(name: "Student #{i*5 + j}")
    end
  end
  u.save
elsif Rails.env.production?

end
