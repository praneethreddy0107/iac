

# abspath Function
# Returns the absolute path of a file.
# Syntax: abspath(file_path)
# Arguments: file_path - The file path.

output "absolute_path" {
  value = abspath(var.file_path)
}

# dirname Function
# Returns the directory portion of a file path.
# Syntax: dirname(file_path)
# Arguments: file_path - The file path.

output "directory_path" {
  value = dirname(var.file_path)
}

# pathexpand Function
# Expands shell-style wildcards in a file path.
# Syntax: pathexpand(file_path)
# Arguments: file_path - The file path.

output "expanded_path" {
  value = pathexpand(var.file_path)
}

# basename Function
# Returns the base name portion of a file path.
# Syntax: basename(file_path)
# Arguments: file_path - The file path.

output "base_name" {
  value = basename(var.file_path)
}

# file Function
# Reads the contents of a file.
# Syntax: file(file_path)
# Arguments: file_path - The file path.

output "file_contents" {
  value = file(var.file_path)
}

# fileexists Function
# Checks if a file exists.
# Syntax: fileexists(file_path)
# Arguments: file_path - The file path.

output "file_exists" {
  value = fileexists(var.file_path)
}

# fileset Function
# Finds files in a directory that match a pattern.
# Syntax: fileset(directory_path, pattern)
# Arguments: directory_path - The directory path.
#            pattern - The pattern to match files.

output "matched_files" {
  value = fileset("/path/to/directory", "*.txt")
}

# filebase64 Function
# Encodes the contents of a file to base64.
# Syntax: filebase64(file_path)
# Arguments: file_path - The file path.

output "file_base64" {
  value = filebase64(var.file_path)
}

# templatefile Function
# Renders a template file with provided variables.
# Syntax: templatefile(template_file, template_vars)
# Arguments: template_file - The path to the template file.
#            template_vars - The variables to use in the template.

#output "rendered_template" {
#  value = templatefile("/path/to/template.tpl", var.template_vars)
#}
