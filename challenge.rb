require 'json'

class ClientManager
  def initialize(data)
    @clients = JSON.parse(data)
  end

  def search_by_name(name)
    clients = @clients.select { |client| client['full_name'].downcase.include?(name.downcase) }
    display(clients)
  end

  def find_duplicate_emails
    email_counts = Hash.new(0)
    duplicates = []

    @clients.each do |client|
      email = client['email']
      email_counts[email] += 1
      duplicates << email if email_counts[email] > 1
    end

    duplicates.uniq!

    if duplicates.empty?
      puts 'No duplicate emails found.'
    else
      puts 'Duplicate emails found:'
      duplicates.each { |email| puts "- #{email}" }
    end
  end

  private

  def display(clients)
    if clients.empty?
      puts 'No matching clients found.'
    else
      clients.each { |client| puts "#{client['full_name']} - #{client['email']}" }
    end
  end
end

data = File.read('clients.json')

manager = ClientManager.new(data)

# Command-line interface
loop do
  puts "\nEnter a command:"
  puts '1. Search clients by name'
  puts '2. Find duplicate emails'
  puts '3. Exit'
  print '> '

  choice = gets.chomp.to_i

  case choice
  when 1
    print 'Enter search query: '
    query = gets.chomp
    manager.search_by_name(query)
  when 2
    manager.find_duplicate_emails
  when 3
    puts 'Exiting program...'
    break
  else
    puts 'Invalid choice. Please enter 1, 2, or 3.'
  end
end
