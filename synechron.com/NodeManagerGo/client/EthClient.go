package client

import (
	"fmt"
	"github.com/ybbus/jsonrpc"
	"log"
)

type AdminInfo struct {
	ID   		string 		`json:"id,omitempty"`
	Name 		string 		`json:"name,omitempty"`
	Enode 		string 		`json:"enode,omitempty"`
	IP 		string 		`json:"ip,omitempty"`
	Ports 		Ports 		`json:"ports,omitempty"`
	ListenAddr 	string 		`json:"listenAddr,omitempty"`
	Protocols 	Protocols	`json:"protocols,omitempty"`
}

type Ports struct {
	Discovery int `json:"discovery"`
	Listener  int `json:"listener,omitempty"`
}

type AdminPeers struct {
	ID      	string   	`json:"id,omitempty"`
	Name    	string   	`json:"name,omitempty"`
	Caps    	[]string 	`json:"caps,omitempty"`
	Network 	Network 	`json:"network,omitempty"`
	Protocols 	Protocols 	`json:"protocols,omitempty"`
}

type Protocols struct {
	Eth Eth `json:"eth,omitempty"`
}

type Eth struct {
	Network    int	  `json:"network,omitempty"`
 	Version    int    `json:"version,omitempty"`
	Difficulty int    `json:"difficulty,omitempty"`
	Genesis    string `json:"genesis,omitempty"`
	Head       string `json:"head,omitempty"`
}

type Network struct {
	LocalAddress  string `json:"localAddress,omitempty"`
	RemoteAddress string `json:"remoteAddress,omitempty"`
}

type BlockDetailsResponse struct {
	Number           string                       `json:"number,omitempty"`
	Hash             string                       `json:"hash,omitempty"`
	ParentHash       string                       `json:"parentHash,omitempty"`
	Nonce            string                       `json:"nonce,omitempty"`
	Sha3Uncles       string                       `json:"sha3Uncles,omitempty"`
	LogsBloom        string                       `json:"logsBloom,omitempty"`
	TransactionsRoot string                       `json:"transactionsRoot,omitempty"`
	StateRoot        string                       `json:"stateRoot,omitempty"`
	Miner            string                       `json:"miner,omitempty"`
	Difficulty       string                       `json:"difficulty,omitempty"`
	TotalDifficulty  string                       `json:"totalDifficulty,omitempty"`
	ExtraData        string                       `json:"extraData,omitempty"`
	Size             string                       `json:"size,omitempty"`
	GasLimit         string                       `json:"gasLimit,omitempty"`
	GasUsed          string                       `json:"gasUsed,omitempty"`
	Timestamp        string                       `json:"timestamp,omitempty"`
	Transactions     []TransactionDetailsResponse `json:"transactions,omitempty"`
	Uncles           []string                     `json:"uncles,omitempty"`
}

type TransactionDetailsResponse struct {
	BlockHash        string `json:"blockHash,omitempty"`
	BlockNumber      string `json:"blockNumber"`
	From             string `json:"from,omitempty"`
	Gas              string `json:"gas,omitempty"`
	GasPrice         string `json:"gasPrice"`
	Hash             string `json:"hash,omitempty"`
	Input            string `json:"input,omitempty"`
	Nonce            string `json:"nonce"`
	To               string `json:"to,omitempty"`
	TransactionIndex string `json:"transactionIndex"`
	Value            string `json:"value,omitempty"`
	V                string `json:"v,omitempty"`
	R                string `json:"r,omitempty"`
	S                string `json:"s,omitempty"`
}

type EthClient struct {
	Url string
}

func (ec *EthClient) GetTransactionByHash(txno string) (TransactionDetailsResponse) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("eth_getTransactionByHash", txno)

	if err != nil {
		fmt.Println(err)
	}
	txresponse := TransactionDetailsResponse{}
	err = response.GetObject(&txresponse)
	if err != nil {
		fmt.Println(err)
	}
	return txresponse
}

func (ec *EthClient) GetBlockByNumber(blockno string) (BlockDetailsResponse) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("eth_getBlockByNumber", blockno, true)
	if err != nil {
		fmt.Println(err)
	}
	blockresponse := BlockDetailsResponse{}
	err = response.GetObject(&blockresponse)
	if err != nil {
		fmt.Println(err)
	}
	return blockresponse
}

func (ec *EthClient) PendingTransactions() ([]TransactionDetailsResponse) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("eth_pendingTransactions")
	if err != nil {
		fmt.Println(err)
	}
	pendingtxresponse := []TransactionDetailsResponse{}
	err = response.GetObject(&pendingtxresponse)
	if err != nil {
		fmt.Println(err)
	}
	return pendingtxresponse
}

func (ec *EthClient) AdminPeers() ([]AdminPeers) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("admin_peers")
	if err != nil {
		fmt.Println(err)
	}
	otherpeersresponse := []AdminPeers{}
	err = response.GetObject(&otherpeersresponse)
	if err != nil {
		fmt.Println(err)
	}
	return otherpeersresponse
}

func (ec *EthClient) AdminNodeInfo () (AdminInfo) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("admin_nodeInfo")
	if err != nil {
		fmt.Println(err)
	}
	thisadmininfo := AdminInfo{}
	err = response.GetObject(&thisadmininfo)
	return thisadmininfo
}

func (ec *EthClient) BlockNumber() (string) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("eth_blockNumber")
	if err != nil {
		fmt.Println(err)
	}
	var blocknumber string;
	err = response.GetObject(&blocknumber)
	if err != nil {
		fmt.Println(err)
	}
	return blocknumber
}

func (ec *EthClient) RaftRole() (string) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("raft_role")
	if err != nil {
		fmt.Println(err)
	}
	var raftrole string;
	err = response.GetObject(&raftrole)
	if err != nil {
		fmt.Println(err)
	}
	return raftrole
}

func (ec *EthClient) RaftAddPeer(request string) (int) {
	rpcClient := jsonrpc.NewRPCClient(ec.Url)
	response, err := rpcClient.Call("raft_addPeer",request)
	var raftid int
	err = response.GetObject(&raftid)
	if err != nil {
		log.Fatal(err)
	}
	return raftid
}