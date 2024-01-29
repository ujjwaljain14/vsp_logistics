import 'package:get/get.dart';
import 'package:vsp_logistics/models/ladle_model.dart';

class SearchScreenViewModel{
  static RxList data = [
  LadleModel(ladleNumber: "LADLE-0005", ladleContent: "Molten metal", lastStation: "Station 1", lastStationTime: "2021-09-01 12:00:00", ladleCirculationTimes: "11:11:11", ladleTurnAroundTimes: "1", ladleHealthPercent: "91%"),
  ].obs;
}
