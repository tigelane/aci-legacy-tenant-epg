resource "aci_bridge_domain" "bridge_domain_lvlan_238_192_168_238" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "lvlan_238"
}

resource "aci_subnet" "subnet_lvlan_238_192_168_238" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_lvlan_238_192_168_238.id}"
  ip                      = "192.168.238.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_lvlan_238_192_168_238" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_lvlan_238_192_168_238.name}"
  description             = "Old vlan 238"
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_lvlan_238_192_168_238.id}"
}