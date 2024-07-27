namespace :db do
  desc 'Prints the count of records for each table'
  task tables_count: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      count = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM #{table}").first['count']
      puts "#{table}: #{count} records"
    end
  end
end
