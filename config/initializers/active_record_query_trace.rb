if Rails.env.development? && ENV.fetch("ENABLE_QUERY_BACKTRACE", false) == "1"
  ActiveRecordQueryTrace.enabled = true
end
