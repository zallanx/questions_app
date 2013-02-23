namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_relationships
  end
end


def make_relationships
  users = User.all
  user  = users.first
  courses = Course.all
  course = courses.first

  followed_courses = courses[1..6]
  followed_courses.each { |followed| user.follow!(followed) }

end	