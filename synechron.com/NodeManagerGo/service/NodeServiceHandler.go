package service

import (
	"net/http"
	"encoding/json"
	"github.com/gorilla/mux"
	"fmt"
	"strconv"
)

func (nsi *NodeServiceImpl) JoinNetworkHandler(w http.ResponseWriter, r *http.Request) {
	var request JoinNetworkRequest
	_ = json.NewDecoder(r.Body).Decode(&request)
	enode := request.EnodeID
	response := nsi.JoinNetwork(enode,nsi.Url)
	json.NewEncoder(w).Encode(response)
}

func (nsi *NodeServiceImpl) GetGenesisHandler(w http.ResponseWriter, r *http.Request) {
	response := nsi.GetGenesis(nsi.Url)
	json.NewEncoder(w).Encode(response)
}

func (nsi *NodeServiceImpl) GetCurrentNodeHandler(w http.ResponseWriter, r *http.Request) {
	response := nsi.GetCurrentNode(nsi.Url)
	json.NewEncoder(w).Encode(response)
}

func (nsi *NodeServiceImpl) GetOtherPeerHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	response := nsi.GetOtherPeer(params["id"],nsi.Url)
	json.NewEncoder(w).Encode(response)
}

func (nsi *NodeServiceImpl) GetBlockInfoHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	block, err := strconv.ParseInt(params["id"], 10, 64)
	if err != nil {
		fmt.Println(err)
	}
	response := nsi.GetBlockInfo(block,nsi.Url)
	json.NewEncoder(w).Encode(response)
}

func (nsi *NodeServiceImpl) GetTransactionInfoHandler(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	if params["id"] == "pending" {
		response := nsi.GetPendingTransactions(nsi.Url)
		json.NewEncoder(w).Encode(response)
	} else {
		response := nsi.GetTransactionInfo(params["id"],nsi.Url)
		json.NewEncoder(w).Encode(response)
	}
}