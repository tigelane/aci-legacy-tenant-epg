resource "aci_bridge_domain" "bridge_domain_vlan_leg_234_10_10_234" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "vlan_leg_234"
}

resource "aci_subnet" "subnet_vlan_leg_234_10_10_234" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_vlan_leg_234_10_10_234.id}"
  ip                      = "10.10.234.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_vlan_leg_234_10_10_234" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_vlan_leg_234_10_10_234.name}"
  description             = ""
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_vlan_leg_234_10_10_234.id}"
}