require 'json'
require 'fileutils'

class TaskTracker
  TASKS_FILE = 'tasks.json'

  def initialize
    setup_file
  end

  def setup_file
    unless File.exist?(TASKS_FILE)
      File.write(TASKS_FILE, JSON.pretty_generate([]))
    end
  end

  def run(args)
    command = args.shift

    case command
      when 'add'
        add_task(args.join(' '))
      when 'list'
        list_tasks(args[0])
      when 'update'
        update_task(args[0].to_i, args[1..].join(' '))
      when 'delete'
        delete_task(args[0].to_i)
      when 'mark-in-progress'
        mark_task(args[0].to_i, 'in-progress')
      when 'complete'
        mark_task(args[0].to_i, 'done')
      else
        puts "Command not found, use: add, list, update, delete, mark-in-progress, complete"
    end
  end

  def add_task(description)
    tasks = load_tasks

    new_task = {
      id: tasks.empty? ? 1 : tasks.last[:id] + 1,
      description: description,
      status: 'todo',
      created_at: Time.now.to_s,
      updated_at: Time.now.to_s
    }

    tasks << new_task
    save_tasks(tasks)
    puts "Task successfully added with ID: #{new_task[:id]}"
  end

  def list_tasks(status = nil)
    tasks = load_tasks

    filtered_tasks = status ? tasks.select { |t| t[:status] == status } : tasks

    if filtered_tasks.empty?
      puts "No tasks found"
    else
      filtered_tasks.each do |task|
        puts "#{task[:id]} - #{task[:description]} - #{task[:status]}"
      end
    end
  end

  def update_task(id, new_description)
    tasks = load_tasks

    task = tasks.find { |t| t[:id] == id }

    if task
      task[:description] = new_description
      task[:updated_at] = Time.now.to_s
      save_tasks(tasks)
      puts "Task successfully updated with ID: #{id}"
    else
      puts "Task not found with ID: #{id}"
    end
  end

  def delete_task(id)
    tasks = load_tasks

    if tasks.reject! { |t| t[:id] == id }
      save_tasks(tasks)
      puts "Task successfully deleted with ID: #{id}"
    else
      puts "Task not found with ID: #{id}"
    end
  end

  def mark_task(id, status)
    tasks = load_tasks

    task = tasks.find { |t| t[:id] == id }

    if task
      task[:status] = status
      task[:updated_at] = Time.now.to_s
      save_tasks(tasks)
      puts "Task successfully marked as #{status} with ID: #{id}"
    else
      puts "Task not found with ID: #{id}"
    end
  end

  private

  def load_tasks
    JSON.parse(File.read(TASKS_FILE), symbolize_names: true)
  end

  def save_tasks(tasks)
    File.write(TASKS_FILE, JSON.pretty_generate(tasks))
  end
end

if __FILE__ == $PROGRAM_NAME
  tracker = TaskTracker.new
  tracker.run(ARGV)
end
