class MaterialData {
  int monId;

  String monName;

  var value;

  String monitorTime;

  int warnLevel;

  MaterialData({this.monId, this.monName, this.value, this.monitorTime, this.warnLevel});
}

List<MaterialData> allMaterialDatas = [
  new MaterialData(
    monId: 22,
    monName: "氨气",
    value: 12.12,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 3,
  ),
  new MaterialData(
    monId: 20,
    monName: "一氧化碳",
    value: 9.12,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 1,
  ),
  new MaterialData(
    monId: 22,
    monName: "甲苯-2,4-二异氰酸酯（TDI）",
    value: 5.18,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 2,
  ),
  new MaterialData(
    monId: 22,
    monName: "乙醇",
    value: 5.62,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 1,
  ),
  new MaterialData(
    monId: 22,
    monName: "甲醇",
    value: 3.18,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
  new MaterialData(
    monId: 22,
    monName: "一氧化氮",
    value: 2.10,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
  new MaterialData(
    monId: 22,
    monName: "甲烷",
    value: 0.38,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
  new MaterialData(
    monId: 22,
    monName: "氨气",
    value: 2.45,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
  new MaterialData(
    monId: 22,
    monName: "臭氧",
    value: 0.137,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
  new MaterialData(
    monId: 22,
    monName: "一氧化碳",
    value: 0.137,
    monitorTime: "2019-03-01 12:00",
    warnLevel: 0,
  ),
];