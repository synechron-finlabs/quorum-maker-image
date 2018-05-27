pragma solidity ^0.4.23;
contract NetworkManagerContract {

    uint nodeCounter;
  
    struct NodeDetails {
  
        string nodeName;
        string role; 
        string publickey;
        string enode;
	string ip;
    }

    mapping (string => NodeDetails)nodes;
    string[] enodeList;
    
    event print(string nodeName, string role,string publickey, string enode, string ip);

    function registerNode(string n, string r, string p,string e, string ip) public {

        nodes[e].publickey = p;
        nodes[e].nodeName = n;
        nodes[e].role = r;
	nodes[e].ip = ip;
        enodeList.push(e);
        emit print(n,r,p,e,ip);
    
    }
   
    function getNodeDetails(uint _index) constant public returns (string n, string r,string p,string ip,string e,uint i) {
        NodeDetails memory nodeInfo = nodes[enodeList[_index]];
        return (
                nodeInfo.nodeName,
                nodeInfo.role,
                nodeInfo.publickey,
		nodeInfo.ip,
                enodeList[_index],
                _index
        );
    }

    function getNodesCounter() public constant  returns (uint) {
        return enodeList.length;
    }

    function updateNode(string n, string r, string p, string e, string ip) public {

        nodes[e].publickey = p;
        nodes[e].nodeName = n;
        nodes[e].role = r;
	nodes[e].ip = ip;
        emit print(n,r,p,e,ip);
    }

    function getNodeList(uint i)  public  constant   returns (string n, string r,string p,string ip,string e) {
        
        NodeDetails memory nodeInfo = nodes[enodeList[i]];
        return (
            nodeInfo.nodeName,
            nodeInfo.role,
            nodeInfo.publickey,
	    nodeInfo.ip,
            enodeList[i]
        );
        
    }

}
