# frozen_string_literal: true
require 'csv'

class QueryRunnerWorker
  include Sidekiq::Worker

  def perform(query_id, query_string)
    puts "\n\n Running query: #{query_id}"
    result = ActiveRecord::Base.connection.execute(query_string)

    results = result.to_a

    file_path = "#{Rails.root}/query_outputs/#{query_id}.csv"

    CSV.open(file_path, "wb", :headers => results.first.keys, :write_headers => true) do |csv|
      result.to_a.each do |record|
        csv << record
      end
    end

    puts "\n\n Query: #{query_id} ran successfully and output is written at: #{file_path} \n\n"
  end
end
