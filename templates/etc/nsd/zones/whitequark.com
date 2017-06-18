$ORIGIN   whitequark.com.
$TTL      86400

@         IN SOA    ns0.whitequark.org. admin.whitequark.org. (2017061801 28800 7200 2419200 86400)
          IN NS     ns0.whitequark.org.
          IN A      {{ ansible_default_ipv4.address }}
          IN AAAA   {{ ansible_default_ipv6.address }}
