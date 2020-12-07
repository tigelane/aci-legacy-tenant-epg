resource "aci_bridge_domain" "bridge_domain_test_dec13_192_168_27" {
  tenant_dn               = "${aci_tenant.tenant.id}"
  relation_fv_rs_ctx      = "${aci_vrf.vrf.id}"
  name                    = "test_dec13"
}

resource "aci_subnet" "subnet_test_dec13_192_168_27" {
  bridge_domain_dn        = "${aci_bridge_domain.bridge_domain_test_dec13_192_168_27.id}"
  ip                      = "192.168.27.1/24"
  scope                   = "private"
}

resource "aci_application_epg" "epg_test_dec13_192_168_27" {
  application_profile_dn  = "${aci_application_profile.app_profile.id}"
  name                    = "${aci_bridge_domain.bridge_domain_test_dec13_192_168_27.name}"
  description             = ""
  relation_fv_rs_bd       = "${aci_bridge_domain.bridge_domain_test_dec13_192_168_27.id}"
}