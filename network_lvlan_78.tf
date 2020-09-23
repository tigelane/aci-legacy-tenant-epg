resource "aci_bridge_domain" "bridge_domain_lvlan_78_192_168_78" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "lvlan_78"
}

resource "aci_subnet" "subnet_lvlan_78_192_168_78" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_lvlan_78_192_168_78.id}"
  ip                      = "192.168.78.1/24"
  scope                   = "public"
}

resource "aci_application_epg" "epg_lvlan_78_192_168_78" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_lvlan_78_192_168_78.name}"
  description             = "Old vlan 78"
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_lvlan_78_192_168_78.id}"
}