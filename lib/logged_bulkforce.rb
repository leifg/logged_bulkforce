require "logged_bulkforce/version"
require "bulkforce"

class LoggedBulkforce
  attr_reader :client
  attr_reader :dir

  def initialize client, dir
    raise ArgumentError, "#{dir} does not exists" unless File.exist?(dir)
    @dir = dir
    @client = client
  end

  def execute(action, *params)
    batch_reference = @client.send(action, *params)
    record_type, values = params
    if batch_reference.is_a?(Hash)
      results = batch_reference[:results]
      final_status = batch_reference
      job_id = batch_reference[:job_id]
    else
      final_status = batch_reference.final_status
      results = batch_reference.results
      job_id = batch_reference.job_id
    end
    write_file record_type, action, values, results, job_id

    final_status
  end

  def self.create
    new(SalesforceBulk.create)
  end

  private

  def write_file(record_type, action, input, output, job_id)
    if input.is_a?(String)
      input = Array.new(output.size) { |i| i == 0 ? {"query" => input} : {"query" => ""} }
    end
    all_keys = input.map{|l| l.keys}.flatten.uniq + output.map{|l| l.keys}.flatten.uniq

    headers = CSV::Row.new(all_keys,[],true)
    table = CSV::Table.new([headers])

    input.zip(output).each do |value_row, error_row|
      csv_row = CSV::Row.new([],[],false)
      [value_row, error_row].each do |row|
        csv_row << row
      end
      table << csv_row.fields(*all_keys)
    end

    File.open("#{dir}/#{record_type}_#{action}_#{job_id}.csv", 'w') do |f|
      f.write(table.to_csv(force_quotes: true))
    end
  end
end
