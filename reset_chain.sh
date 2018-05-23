#!/bin/bash

killall geth
killall constellation-node

sleep 2

cd /home/node/qdata
cp geth/chaindata/000002.ldb .
[ "$(ls -A geth/chaindata/*.log 2>/dev/null )" ] && rm geth/chaindata/*.log || echo "Not found .log"
[ "$(ls -A geth/chaindata/*.ldb 2>/dev/null )" ] && rm geth/chaindata/*.ldb || echo "Not found .ldb"
[ "$(ls -A geth/transactions.rlp 2>/dev/null )" ] && rm geth/transactions.rlp || echo "Not found transactions.rlp"
[ "$(ls -A geth/ethash/* 2>/dev/null)" ] && rm geth/ethash/* || echo "Not found ethash"
[ "$(ls -A storage/payloads/* 2>/dev/null)" ] && rm storage/payloads/* || echo "Not found payloads"
[ "$(ls -A logs/* 2>/dev/null)" ] && rm logs/* || echo "Not found logs"
cp 000002.ldb geth/chaindata/.
