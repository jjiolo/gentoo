
function FindProxyForURL(url, host)
{
 if (shExpMatch(host, "*.onion"))
 {
  return "SOCKS5 127.0.0.1:9050";
 } else if (shExpMatch(host, "*.i2p")) {
  return "SOCKS5 127.0.0.1:4447";
 }
 return "DIRECT";
}

