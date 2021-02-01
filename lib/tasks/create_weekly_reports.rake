task :create_weekly_reports  => [:environment] do

  pages=Page.where(daily_run: false, weekly_run: true).where.not(project: nil)
  pages.each { |page|
    puts "Adding report for url #{page.valid_url}..."
    begin
      page.add_lighthouse_report
      puts "success"
    rescue => err
      puts err
      puts err.backtrace
    end
  }

  puts "weekly reports created !"
end