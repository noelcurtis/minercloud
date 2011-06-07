#!/usr/bin/ruby -w
# ProcessBitcoinSolution.rb - process a pushpool upstream solution when it is found

require "mysql"

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect("localhost", "root", "Nw.WMVHviyxfs6UZK4kkdc", "minercloud_production")

  # Find solution shares
  res = dbh.query(" select * from shares where upstream_result = 'Y'")

  res.each_hash do |row|
    puts "ID: #{row["id"]}\n"
  end
  puts "Number of rows returned: #{res.num_rows}"

  res.free
  
  # Find worker shares count
  res = dbh.query("SELECT worker_id, COUNT(worker_id) FROM shares WHERE id BETWEEN 498 AND 669 GROUP BY worker_id")

  res.each_hash do |row|
    puts "Worker ID: #{row["worker_id"]}\t Share count: #{row["COUNT(worker_id)"]} \n"
  end
  puts "Number of rows returned: #{res.num_rows}"

  res.free
  
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure
  # disconnect from server
  dbh.close if dbh
end


# Called when we find a solution

# Find all the upstream_result == Y solutions

# Find the first unprocessed solution

# Find the previous processed solution (could be none) and get the ID

# Calculate all the number of shares for each worker look at mysql count

# Save shares

# Insert unprocessed solution into found_blocks table

# Set to unprocessed solution to processed

# If 5 solutions have been found delete all the shares for the oldest round

