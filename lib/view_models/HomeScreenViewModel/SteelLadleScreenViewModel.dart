
import 'package:vsp_logistics/models/checkpoint_model.dart';

class SteelLadleScreenViewModel{

  static List stageList = [
    CheckPointModel(stageName: "Ladle preparation bay", toLadleCount: "0", froLadleCount: "0", efficiency: "10", lastUpdate: "11:11"),
    CheckPointModel(stageName: "LF-1", toLadleCount: "0", froLadleCount: "0", efficiency: "-10", lastUpdate: "11:11"),
    CheckPointModel(stageName: "LF-2", toLadleCount: "0", froLadleCount: "0", efficiency: "10", lastUpdate: "11:11"),
    CheckPointModel(stageName: "RH", toLadleCount: "0", froLadleCount: "0", efficiency: "10", lastUpdate: "11:11"),
    CheckPointModel(stageName: "Caster machines", toLadleCount: "0", froLadleCount: "0", efficiency: "-10", lastUpdate: "11:11"),
  ];
}