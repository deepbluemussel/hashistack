nomad
=====
::

  nomad_datacenter_name: "{{ workspace }}"
  nomad_version: "1.2.4"

  nomad_inventory_masters_group: "{{ workspace }}_masters"
  nomad_inventory_minions_group: "{{ workspace }}_minions"
  nomad_local_secrets_dir: "{{ workspace_secrets_dir }}"
  nomad_consul_address: "127.0.0.1:8501"
  nomad_node_cert: "{{ host_secrets_dir }}/self.cert.pem"
  nomad_node_cert_private_key: "{{ host_secrets_dir }}/self.cert.key"
  nomad_node_cert_fullchain: "{{ host_secrets_dir }}/self.fullchain.cert.pem"
  nomad_bootstrap_expect: "3"
  nomad_master_partners: >-
    {{
      groups[nomad_inventory_masters_group]
      | difference([inventory_hostname])
    }}

  nomad_sysctl:
    - name: "net.bridge.bridge-nf-call-arptables"
      value: "1"
    - name: "net.bridge.bridge-nf-call-ip6tables"
      value: "1"
    - name: "net.bridge.bridge-nf-call-iptables"
      value: "1"
