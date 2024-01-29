
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../utils/consts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController controller = TextEditingController();
  int count =0;
  String ladleCount = "0";

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    httpClient = Client();
    ethClient = Web3Client(Consts.infura_url, httpClient!);
    Timer(
        const Duration(seconds: 2),
            () {
              setState(() {
                // print(fetchCLnt("converter")[0]);
                fetchCLnt("converter").then((value) => print("--------------------------- ${value[0]}"));
              });
            }
            );
    // manufactureLadle();

  }

  Future<DeployedContract> loadContract()async{
    String abi = await rootBundle.loadString("assets/abi.json");
    final contract = DeployedContract(ContractAbi.fromJson(abi, "TLC"), EthereumAddress.fromHex(Consts.contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args)async{
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient!.call(contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<List<dynamic>> manufactureLadle(String productCode)async{
    // EthereumAddress address = EthereumAddress.fromHex(Consts.myAddress);
    List<dynamic> result = await query("manufactureLadle", [productCode]);
    return result;
  }
  Future<List<dynamic>> shipToConverter(String productCode)async{
    // EthereumAddress address = EthereumAddress.fromHex(Consts.myAddress);
    List<dynamic> result = await query("manufactureLadle", [productCode]);
    return result;
  }
  Future<List<dynamic>> receiveByConverter(String productCode)async{
    // EthereumAddress address = EthereumAddress.fromHex(Consts.myAddress);
    List<dynamic> result = await query("manufactureLadle", [productCode]);
    return result;
  }
  Future<List<dynamic>> fetchCLnt(String stageName)async{
    // EthereumAddress address = EthereumAddress.fromHex(Consts.myAddress);
    List<dynamic> result = await query("manufactureLadle", [stageName]);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TLC"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                ladleCount.toString(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height : 45,
              child: ElevatedButton(onPressed: () {
                if(count % 3 == 1) {
                  manufactureLadle("50");
                }else if(count % 3 == 2) {
                  shipToConverter("50");
                }else{
                  receiveByConverter("50");
                }
                count++;
                setState(() {
                });
              }, child: Text("Ladle operation ${count%3}")),
            )
          ],
        )
      )
    );
  }
}
