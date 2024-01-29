class LadleModel{
  LadleModel({
    required this.ladleNumber,
    required this.ladleContent,
    required this.lastStation,
    required this.lastStationTime,
    required this.ladleCirculationTimes,
    required this.ladleTurnAroundTimes,
    required this.ladleHealthPercent,
    this.ladleTemperature ="1000 C",
    this.ladleWeight = "1000 Kg",
    this.ladleCapacity = "1000 Lt",
  });

  final String ladleNumber;
  final String ladleContent;
  final String lastStation;
  final String lastStationTime;
  final String ladleCirculationTimes;
  final String ladleTurnAroundTimes;
  final String ladleHealthPercent;
  final String ladleTemperature;
  final String ladleWeight;
  final String ladleCapacity;
}