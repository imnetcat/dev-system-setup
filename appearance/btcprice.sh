watch -tcn5  "curl -s https://api-pub.bitfinex.com/v2/ticker/tBTCUSD | awk -F',' '{print \"BTC/USD: $\" \$7}'"
