go get -u github.com/gorilla/mux
go get -u github.com/ybbus/jsonrpc
go get -u github.com/magiconair/properties
cd /root/go/src/synechron.com/NodeManagerGo
go build
mv /root/go/src/synechron.com/NodeManagerGo/NodeManagerGo /root/quorum-maker/.
cd /root/go/src/
rm -rf github.com 
rm -rf synechron.com
cd /usr/local
rm -rf go
cd /root/quorum-maker
rm -rf /root/quorum-maker/install_baseimage.sh
rm -rf /root/quorum-maker/install_languages.sh
rm -rf /root/quorum-maker/install_quorum.sh
rm -rf /root/quorum-maker/build_go.sh

