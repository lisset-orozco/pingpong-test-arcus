Rails.application.config.active_job.queue_adapter = :resque

rails_env = ENV['RAILS_ENV'] || 'development'
config = YAML.load_file(Rails.root.join 'config', 'resque.yml')
Resque.redis = config[rails_env]