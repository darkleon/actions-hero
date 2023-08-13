terraform {
  required_version = "~> 0.12"
  required_providers {
  }
}

resource "local_file" "myfile1" {
  for_each = toset(["11","22","33"])
  filename = "files/myfile_${each.key}.txt"
  content = ""

  # provisioner "local-exec" {
  #   command = "echo ${each.key} > files/myfile_${each.key}.txt"
  # }
}

# resource "null_resource" "updater" {
#   for_each = toset(keys(local_file.myfile1))

#   provisioner "local-exec" {
#     command = "echo ${each.key} > files/myfile_${each.key}.txt"
#   }
# }

output "names" {
  value ={
    for k,v in local_file.myfile1 : k => {"filename": v.filename, "content": v.content}
  }
}

output "name1" {
  value = tolist(values({"a": 1, "b": 2}))
}