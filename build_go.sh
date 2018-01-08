cd /usr/local/go/src/synechron.com/NodeManagerGo
go build 
mv /usr/local/go/src/synechron.com/NodeManagerGo/NodeManagerGo /root/quorum-maker/.
cd /usr/local/go/src/
rm -rf github.com 
rm -rf synechron.com
cd /root/quorum-maker