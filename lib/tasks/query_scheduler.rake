namespace :query_scheduler do
  desc "This task fetches queries and schedules"

  task :run => :environment do
    start_time = Time.now
    end_time = Time.now + 1.hour

    records = QueryStore.where(run_at: start_time .. end_time)

    puts "\n\n Scheduling #{records.count} queries ... \n\n"
    records.find_each do |query|
      QueryRunnerWorker.perform_at(query.run_at, query.id, query.query_string)
    end
  end
end
