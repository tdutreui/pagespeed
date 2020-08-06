task :create_new_reports  => [:environment] do
  LighthouseReport.all.pluck(:user_id,:valid_url).uniq.each { |user_id,valid_url|
    puts "Adding report for url #{valid_url}..."
    LighthouseReport.create(user_id: user_id, url: valid_url)
    puts "done."
  }

  puts "new reports created !"
end