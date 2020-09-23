resource "aci_bridge_domain" "bridge_domain_lvlan_96_192_168_96" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "lvlan_96"
}

resource "aci_subnet" "subnet_lvlan_96_192_168_96" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_lvlan_96_192_168_96.id}"
  ip                      = "192.168.96.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_lvlan_96_192_168_96" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_lvlan_96_192_168_96.name}"
  description             = "Old vlan 96"
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_lvlan_96_192_168_96.id}"
}