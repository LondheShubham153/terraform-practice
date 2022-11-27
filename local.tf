resource "local_file" "pet" {

  filename = "/home/practicevm1/Day1/terraform-local/devops_automated.txt"
  content  = "I wants to become a devops engineer who knows terraform"
}

resource "random_string" "rand_str" {

  length           = 16
  special          = true
  override_special = "~!$%^*()_+<>:?{}|"
}

output "rand_str" {

  value = random_string.rand_str
}