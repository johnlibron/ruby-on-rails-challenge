max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

port ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

preload_app!

allow_puma_ssl = ENV.fetch("PUMA_SSL") { false }

if allow_puma_ssl
  ssl_bind '127.0.0.1', '9293', {
    cert: ENV.fetch('SSL_CERT'),
    key: ENV.fetch('SSL_KEY')
  }
end

prune_bundler