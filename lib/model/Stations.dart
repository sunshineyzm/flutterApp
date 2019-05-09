class Stations {
  final int stId;

  final String name;

  final int warnNumber;

  final String status;

  final Map weather;

  Stations({this.stId, this.name, this.warnNumber, this.status, this.weather});
}

List<Stations> stations = [
  new Stations(
    stId: 0,
    name: "龙沙子站",
    warnNumber: 1,
    status: "正常",
    weather: {'temperature': '19', 'windDirection': '东北风', 'windSpeed': '6'}
  ),
  new Stations(
    stId: 1,
    name: "久泰子站",
    warnNumber: 0,
    status: "正常",
    weather: {'temperature': '21', 'windDirection': '东南风', 'windSpeed': '5'}
  ),
  new Stations(
    stId: 2,
    name: "建滔子站",
    warnNumber: 2,
    status: "正常",
    weather: {'temperature': '19', 'windDirection': '东北风', 'windSpeed': '6'}
  ),
  new Stations(
    stId: 3,
    name: "振戎石化子站",
    warnNumber: 0,
    status: "正常",
    weather: {'temperature': '21', 'windDirection': '东南风', 'windSpeed': '5'}
  ),
  new Stations(
    stId: 4,
    name: "小虎村子站",
    warnNumber: 3,
    status: "正常",
    weather: {'temperature': '19', 'windDirection': '东北风', 'windSpeed': '6'}
  ),
  new Stations(
    stId: 5,
    name: "沙螺湾村子站",
    warnNumber: 0,
    status: "正常",
    weather: {'temperature': '21', 'windDirection': '东南风', 'windSpeed': '5'}
  ),
  new Stations(
    stId: 6,
    name: "中心子站",
    warnNumber: 2,
    status: "正常",
    weather: {'temperature': '19', 'windDirection': '东北风', 'windSpeed': '6'}
  ),
];
