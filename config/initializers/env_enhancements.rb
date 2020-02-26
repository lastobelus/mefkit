def ENV.fetch_int(name, default)
  value = fetch(name, default)
  Integer(value) rescue default
end

def ENV.fetch_boolean(name, default = false)
  value = fetch(name, nil)
  return default if value.nil?
  return ["1", "true", "on", "yes"].include?(value.to_s)
end
