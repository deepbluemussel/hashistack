vault
=====
::

  vault_cluster_name: "{{ workspace }}"
  vault_version: "1.9.0"

  vault_inventory_masters_group: "{{ workspace }}_masters"
  vault_inventory_minions_group: "{{ workspace }}_minions"

  vault_api_address: "{{ inventory_hostname }}"
  vault_api_protocol: "https"
  vault_api_port: "8200"
  vault_listener_address: "0.0.0.0:8200"
  vault_listener_cluster_address: "0.0.0.0:8201"

  vault_use_custom_ca: true
  vault_cluster_address: "{{ inventory_hostname }}"
  vault_cluster_protocol: "https"
  vault_cluster_port: "8201"

  vault_master_partners: >-
    {{
      groups[vault_inventory_masters_group]
      | difference([inventory_hostname])
      | map('regex_replace', '_', '-')
    }}

  vault_node_cert: "{{ host_secrets_dir }}/self.cert.pem"
  vault_node_cert_private_key: "{{ host_secrets_dir }}/self.cert.key"
  vault_node_cert_fullchain: "{{ host_secrets_dir }}/self.fullchain.cert.pem"
