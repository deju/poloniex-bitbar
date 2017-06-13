#!/bin/bash

# <bitbar.title>ETC USD price at Poloniex</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>deju.tu@gmail.com</bitbar.author>
# <bitbar.author.github>deju</bitbar.author.github>
# <bitbar.desc>Shows the last NXT price (in USD) on the Poloniex exchange</bitbar.desc>
# <bitbar.abouturl>https://ethereumclassic.github.io/</bitbar.abouturl>
# 



Ret=$(curl -s https://poloniex.com/public?command=returnTicker | tr '}' '\n' | grep USDT_ETC | tr -d '{}"')
last=$(echo $Ret | tr ':,' '\n' | grep -A1 "last" | tail -1)
lowestAsk=$(echo $Ret | tr ':,' '\n' | grep -A1 "lowestAsk" | tail -1)
highestBid=$(echo $Ret | tr ':,' '\n' | grep -A1 "highestBid" | tail -1)
percentChange=$(echo $Ret | tr ':,' '\n' | grep -A1 "percentChange" | tail -1)
printf "ETC $%.*f\n" 4 "$last"
percent=`echo "$percentChange * 100"|bc`
echo "percent     $percent%"
echo "LowestAsk   $lowestAsk"
echo "HighestBid  $highestBid"
echo "---"
echo "ETC in Poloniex | href=\"https://poloniex.com/exchange#usdt_etc\""
echo "ETC homepage | href=\"https://ethereumclassic.github.io\""
echo "Poloniex Login page | href=\"https://poloniex.com/login\""

