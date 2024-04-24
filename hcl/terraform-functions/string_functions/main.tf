# String Functions Examples

# String functions:
# - length: Returns the length of a string.
#   Syntax: length(string)
#   Arguments: string - The input string whose length is to be calculated.

output "string_length" {
  value = length(var.input_string) # Returns the length of the input string
}

# - substr: Extracts a substring from a string.
#   Syntax: substr(string, start_index, length)
#   Arguments: string - The input string from which the substring is to be extracted.
#              start_index - The index of the first character of the substring (1-based index).
#              length - The length of the substring to extract.

output "substring" {
  value = substr(var.input_string, 1, 3) # Extracts a substring starting at index 1 with a length of 3 characters
}

# - trim: Removes leading and trailing whitespace from a string.
#   Syntax: trim(string)
#   Arguments: string - The input string from which leading and trailing whitespace are to be removed.

output "trimmed_string" {
  value = trim(var.input_string, " ") # Removes leading and trailing whitespace from the input string
}


# - upper: Converts a string to uppercase.
#   Syntax: upper(string)
#   Arguments: string - The input string to convert to uppercase.

output "uppercased_string" {
  value = upper(var.input_string) # Converts the input string to uppercase
}

# - lower: Converts a string to lowercase.
#   Syntax: lower(string)
#   Arguments: string - The input string to convert to lowercase.

output "lowercased_string" {
  value = lower(var.input_string) # Converts the input string to lowercase
}

# - concat: Concatenates multiple strings together.
#   Syntax: concat(string1, string2, ...)
#   Arguments: string1, string2, ... - The strings to concatenate.

output "concatenated_strings" {
  value = concat([var.string1], [var.string2]) # Concatenates two strings together
}


# - replace: Replaces occurrences of a substring within a string.
#   Syntax: replace(string, old_substring, new_substring)
#   Arguments: string - The input string in which replacements are to be made.
#              old_substring - The substring to search for and replace.
#              new_substring - The substring to replace occurrences of the old substring.

output "replaced_string" {
  value = replace(var.input_string, "world", "Terraform") # Replaces occurrences of "world" with "Terraform" in the input string
}
# String Functions Examples

# chomp Function
# chomp removes newline characters at the end of a string.
# Syntax: chomp(string)
# Arguments: string - The input string to remove newline characters from.

output "chomped_string" {
  value = chomp(var.input_string)
}

# endswith Function
# endswith checks if a string ends with a specified suffix.
# Syntax: endswith(string, suffix)
# Arguments: string - The input string to check.
#            suffix - The suffix to check for at the end of the string.

output "ends_with_suffix" {
  value = endswith(var.input_string, "\n")
}

# format Function
# format formats a string according to a format specifier.
# Syntax: format(format_string, args...)
# Arguments: format_string - The format specifier string.
#            args... - Arguments to insert into the format specifier.

output "formatted_string" {
  value = format("Hello, %s!", "world")
}

# formatlist Function
# formatlist formats a list of strings according to a format specifier.
# Syntax: formatlist(format_string, list)
# Arguments: format_string - The format specifier string.
#            list - The list of strings to format.

output "formatted_list" {
  value = formatlist("Hello, %s!", var.list_of_strings)
}

# indent Function
# indent indents a string by a specified number of spaces.
# Syntax: indent(string, spaces)
# Arguments: string - The input string to indent.
#            spaces - The number of spaces to indent by.

output "indented_string" {
  value = indent(2, var.input_string)
}


# join Function
# join joins a list of strings into a single string with a separator.
# Syntax: join(separator, list)
# Arguments: separator - The separator to use between elements.
#            list - The list of strings to join.

output "joined_string" {
  value = join(", ", var.list_of_strings)
}



# regex Function
# regex matches a regular expression pattern against a string.
# Syntax: regex(pattern, string)
# Arguments: pattern - The regular expression pattern to match.
#            string - The input string to match against.

output "regex_match" {
  value = regex("^[a-zA-Z]+$", "hello")
}

# regexall Function
# regexall matches all occurrences of a regular expression pattern against a string.
# Syntax: regexall(pattern, string)
# Arguments: pattern - The regular expression pattern to match.
#            string - The input string to match against.

output "regex_all_matches" {
  value = regexall("\\w+", "hello world")
}



# split Function
# split splits a string into a list of substrings based on a separator.
# Syntax: split(separator, string)
# Arguments: separator - The separator to split the string by.
#            string - The input string to split.

output "split_string" {
  value = split(" ", var.input_string)
}

# startswith Function
# startswith checks if a string starts with a specified prefix.
# Syntax: startswith(string, prefix)
# Arguments: string - The input string to check.
#            prefix - The prefix to check for at the start of the string.

output "starts_with_prefix" {
  value = startswith(var.input_string, "hello")
}

# strcontains Function
# strcontains checks if a string contains a specified substring.
# Syntax: strcontains(string, substring)
# Arguments: string - The input string to check.
#            substring - The substring to check for within the string.

output "contains_substring" {
  value = strcontains(var.input_string, "world")
}

# strrev Function
# strrev reverses a string.
# Syntax: strrev(string)
# Arguments: string - The input string to reverse.

output "reversed_string" {
  value = strrev(var.input_string)
}

# title Function
# title converts the first character of each word in a string to uppercase.
# Syntax: title(string)
# Arguments: string - The input string to convert.

output "title_string" {
  value = title("this is a title")
}

# trimprefix Function
# trimprefix removes a specified prefix from a string.
# Syntax: trimprefix(string, prefix)
# Arguments: string - The input string from which the prefix is to be removed.
#            prefix - The prefix to remove from the string.

output "trimmed_prefix" {
  value = trimprefix(var.prefix, "prefix_")
}

# trimsuffix Function
# trimsuffix removes a specified suffix from a string.
# Syntax: trimsuffix(string, suffix)
# Arguments: string - The input string from which the suffix is to be removed.
#            suffix - The suffix to remove from the string.

output "trimmed_suffix" {
  value = trimsuffix(var.suffix, "_suffix")
}

# trimspace Function
# trimspace removes leading and trailing whitespace from a string.
# Syntax: trimspace(string)
# Arguments: string - The input string from which leading and trailing whitespace are to be removed.

output "trimmed_spaces" {
  value = trimspace(var.text_with_spaces)
}
