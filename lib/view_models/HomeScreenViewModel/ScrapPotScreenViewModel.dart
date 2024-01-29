
import 'package:vsp_logistics/models/checkpoint_model.dart';

class ScrapPotScreenViewModel{

  static List stageList = [
    CheckPointModel(stageName: "Converter", toLadleCount: "0", froLadleCount: "0", efficiency: "10", lastUpdate: "11:11"),
    CheckPointModel(stageName: "Slag dumping area", toLadleCount: "0", froLadleCount: "0", efficiency: "-10", lastUpdate: "11:11"),
  ];
}