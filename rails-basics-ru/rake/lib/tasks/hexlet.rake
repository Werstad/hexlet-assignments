require 'csv'

namespace :hexlet do
  desc 'import users'
  task :import_users, [:path] => :environment do |_t, args|
    abort 'Error! File path not passed!' if args[:path].blank?

    abort 'Error! File not exist!' unless File.exist?(args[:path])

    print "#{'*' * 3} Good #{'*' * 3}\n"
    CSV.foreach(args[:path], headers: true, header_converters: :symbol) do |user|
      user[:birthday] = DateTime.strptime(user[:birthday], '%m/%d/%Y')
      User.create(user)
      print '.'
    end
    print "\n#{'*' * 3} Done! #{'*' * 3}\n"
  end
end
