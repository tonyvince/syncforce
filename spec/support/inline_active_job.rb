RSpec.configure do |config|
  config.around(:each, type: :request) do |example|
    original_queue_adapter = ActiveJob::Base.queue_adapter
    descendants = ActiveJob::Base.descendants + [ActiveJob::Base]

    ActiveJob::Base.queue_adapter = :inline
    descendants.each(&:disable_test_adapter)
    example.run
    descendants.each { |a| a.enable_test_adapter(ActiveJob::QueueAdapters::TestAdapter.new) }
    ActiveJob::Base.queue_adapter = original_queue_adapter
  end
end
