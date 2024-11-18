data "http" "gateway_crds" {
  url = "https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.0/standard-install.yaml"
  retry {
    attempts = 2
  }
}

resource "kubernetes_manifest" "gateway_crds" {
  for_each = { for value in provider::kubernetes::manifest_decode_multi(data.http.gateway_crds.body) : value.metadata.name => value }
  # we have to do this block in order to remove the "status" field
  manifest = {
    apiVersion = each.value.apiVersion
    kind       = each.value.kind
    # we have to do this block in order to remove the "creationTimestamp" field
    metadata = {
      name        = each.value.metadata.name
      annotations = each.value.metadata.annotations
    }
    spec = each.value.spec
  }
}
