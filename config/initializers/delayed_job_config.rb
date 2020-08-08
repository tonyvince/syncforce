# frozen_string_literal: true

Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 7.minutes
Delayed::Worker.logger = Logger.new(Rails.root.join('log/delayed_job.log'))
