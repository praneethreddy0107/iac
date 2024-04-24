# Date and Time Functions Examples

# Define sample variables for demonstration purposes
variable "timestamp" {
  description = "Timestamp for date and time functions"
  default     = "2023-04-15T12:00:00Z"
}

variable "timestamp2" {
  description = "Another timestamp for date and time functions"
  default     = "2023-04-20T12:00:00Z"
}

# Define local value to store the current timestamp
locals {
  current_timestamp = timestamp()
}

# formatdate Function
# Formats a timestamp into a string using a specified format.
# Syntax: formatdate(timestamp, format)
# Arguments: timestamp - The timestamp to format.
#            format - The format string.

output "formatted_date" {
  value = formatdate(local.current_timestamp, "YYYY-MM-DD")
}

# current_timestamp Local Value
# Stores the current timestamp
# Usage: local.current_timestamp

output "current_timestamp_output" {
  value = local.current_timestamp
}

# timeadd Function
# Adds a duration to a timestamp.
# Syntax: timeadd(timestamp, duration)
# Arguments: timestamp - The base timestamp.
#            duration - The duration to add (in ISO 8601 duration format).

output "timestamp_after_addition" {
  value = timeadd(var.timestamp, "7d") # Adds 7 days to the timestamp
}

# timecmp Function
# Compares two timestamps.
# Syntax: timecmp(timestamp1, timestamp2)
# Arguments: timestamp1 - The first timestamp.
#            timestamp2 - The second timestamp.

output "comparison_result" {
  value = timecmp(var.timestamp, var.timestamp2)
}

# timestamp Function
# Returns the current timestamp.
# Syntax: timestamp()

output "current_timestamp" {
  value = timestamp()
}
