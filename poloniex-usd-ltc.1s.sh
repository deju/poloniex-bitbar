#!/bin/bash

# <bitbar.title>LiteCoin USD price at Poloniex</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>deju.tu@gmail.com</bitbar.author>
# <bitbar.author.github>deju</bitbar.author.github>
# <bitbar.desc>Shows the last BitCoin price (in USD) on the Poloniex exchange</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/deju/poloniex-bitbar/master/icons/btc.png</bitbar.image>
# <bitbar.abouturl>https://litecoin.org/en/</bitbar.abouturl>
# 

btcRet=$(curl -s https://poloniex.com/public?command=returnTicker | tr '}' '\n' | grep USDT_LTC | tr -d '{}"')
last=$(echo $btcRet | tr ':,' '\n' | grep -A1 "last" | tail -1)
lowestAsk=$(echo $btcRet | tr ':,' '\n' | grep -A1 "lowestAsk" | tail -1)
highestBid=$(echo $btcRet | tr ':,' '\n' | grep -A1 "highestBid" | tail -1)
percentChange=$(echo $btcRet | tr ':,' '\n' | grep -A1 "percentChange" | tail -1)
printf "LTC $%.*f\n" 2 "$last"
percent=`echo "$percentChange * 100"|bc`
echo "percent     $percent%"
echo "LowestAsk   $lowestAsk"
echo "HighestBid  $highestBid"
echo "---"
echo "LiteCoin in Poloniex | href=\"https://poloniex.com/exchange#usdt_ltc\""
echo "LiteCoin homepage | href=\"https://litecoin.org/en\""
echo "Poloniex Login page | href=\"https://poloniex.com/login\""

