resource "consul_acl_policy" "minions_write" {
  name        = "minions_write"
  datacenters = [var.datacenter]
  rules       = <<-RULE
    node_prefix "" {
      policy = "write"
    }
    RULE
}


resource "consul_acl_policy" "nomad_server" {
  name        = "nomad_server"
  datacenters = [var.datacenter]
  rules       = <<-RULE
    agent_prefix "" {
      policy = "read"
    }

    node_prefix "" {
      policy = "read"
    }

    service_prefix "" {
      policy = "write"
    }

    acl = "write"
    RULE
}

resource "consul_acl_token" "nomad_server" {
  description = "nomad servers token"
  policies = [consul_acl_policy.nomad_server.name]
  local = true
}

resource "consul_acl_policy" "nomad_client" {
  name        = "nomad_client"
  datacenters = [var.datacenter]
  rules       = <<-RULE
    agent_prefix "" {
      policy = "read"
    }

    node_prefix "" {
      policy = "read"
    }

    service_prefix "" {
      policy = "write"
    }

    key_prefix "" {
      policy = "read"
    }
    RULE
}

resource "consul_acl_token" "nomad_client" {
  description = "nomad clients token"
  policies = [consul_acl_policy.nomad_client.name]
  local = true
}
