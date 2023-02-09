
function FindProxyForURL(url, host)
{
 if (shExpMatch(host, "*.onion"))
 {
  return "SOCKS5 127.0.0.1:9050";
 }
 return "DIRECT";
}

