resource "aci_bridge_domain" "bridge_domain_new_vlan_34_10_1_1" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "new_vlan_34"
}

resource "aci_subnet" "subnet_new_vlan_34_10_1_1" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_new_vlan_34_10_1_1.id}"
  ip                      = "10.1.1.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_new_vlan_34_10_1_1" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_new_vlan_34_10_1_1.name}"
  description             = ""
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_new_vlan_34_10_1_1.id}"
}