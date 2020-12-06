resource "aci_bridge_domain" "bridge_domain_vlan108mgmt_10_1_108" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "vlan108mgmt"
}

resource "aci_subnet" "subnet_vlan108mgmt_10_1_108" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_vlan108mgmt_10_1_108.id}"
  ip                      = "10.1.108.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_vlan108mgmt_10_1_108" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_vlan108mgmt_10_1_108.name}"
  description             = "old mgmtvlan 108"
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_vlan108mgmt_10_1_108.id}"
}