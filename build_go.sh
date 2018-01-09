go get -u github.com/gorilla/mux
go get -u github.com/ybbus/jsonrpc
go get -u github.com/magiconair/properties
mkdir /root/go/src/synechron.com
cd /root/go/src/synechron.com/
git clone https://RakhiB:Rakhi123@gitlab.com/quorum-maker/NodeManagerGo.git
cd NodeManagerGo
go build
mv /root/go/src/synechron.com/NodeManagerGo/NodeManagerGo /root/quorum-maker/.
cd /root/go/src/
rm -rf github.com 
rm -rf synechron.com
cd /root/quorum-maker
