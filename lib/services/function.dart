

import 'package:flutter/services.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  String contractAddress = "0x820F73807a518744aA7D673E762774e12d17503A";
  final contract = DeployedContract(ContractAbi.fromJson(abi, "Tracking"), EthereumAddress.fromHex(contractAddress));
  return contract;
}

// Future<String> callFunction(String )