import 'package:flutter/material.dart';
import 'settingtime.dart';
import 'InfoViewModel.dart';
import 'main.dart';

class Luggage extends StatefulWidget {
  final String title;
  final String currentLocation;
  final String destination;
  final String timeType;
  final String setTime;
  const Luggage(
      {super.key,
      required this.title,
      required this.currentLocation,
      required this.destination,
      required this.timeType,
      required this.setTime});

  @override
  State<Luggage> createState() => _Luggage();
}

class _Luggage extends State<Luggage> {
  final List<String> items = ['筆箱', 'PC', 'ノート', '教科書', '財布'];
  var luggageList = [];
  var luggage = '';
  late String stateTitle;
  late String stateCurrentLocation;
  late String stateDestination;
  late String stateTimeType;
  late String stateSetTime;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    stateTitle = widget.title;
    stateCurrentLocation = widget.currentLocation;
    stateDestination = widget.destination;
    stateTimeType = widget.timeType;
    stateSetTime = widget.setTime;
  }

  Future<void> _addItem(stateCurrentLocation, stateDestination, stateTimeType,
      stateSetTime, luggage) async {
    // print(_id);
    await InfoViewModel.insertItem(stateCurrentLocation, stateDestination,
        stateTimeType, stateSetTime, luggage);
    // _id = _id + 10;
    // _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(stateTitle),
        ),
        body: Column(children: [
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // Container:Text('現在地'),

                  children: List.generate(items.length, (index) {
                    if (index == 0) {
                      return Column(children: [
                        Container(child: Text('持ち物リスト')),
                        ElevatedButton(
                          onPressed: () {
                            // ボタンが押された時の処理
                            print('Buftton $index pressed!');
                            // print('Button $items[$index] pressed!');
                            print(items[index]);
                            luggage = items[index];
                          },
                          child: Text(items[index]),
                        ),
                      ]);
                    }
                    return ElevatedButton(
                      onPressed: () {
                        // ボタンが押された時の処理
                        print('Buftton $index pressed!');
                        // print('Button $items[$index] pressed!');
                        print(items[index]);
                        luggage = items[index];
                      },
                      child: Text(items[index]),
                    );
                  }),
                ),
              ])),
          ElevatedButton(
            child: Text("保存"),
            onPressed: () async {
              print('入力内容');
              print(stateCurrentLocation);
              print(stateDestination);
              print(stateTimeType);
              print(stateSetTime);
              print(luggage);
              _addItem(stateCurrentLocation, stateDestination, stateTimeType,
                  stateSetTime, luggage);
              // "push"で新規画面に遷移
              // リスト追加画面から渡される値を受け取る
              Navigator.of(context).popUntil((route) => route.isFirst);
              // final newListText = await Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) {
              //     // 遷移先の画面としてリスト追加画面を指定
              //     return MyHomePage(
              //       title: '時間入力画面',
              //     );
              //   }),
              // );
              // if (newListText != null) {
              //   // キャンセルした場合は newListText が null となるので注意
              // }
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     "/sub1page", ModalRoute.withName("/home"));
              //     Navigator.of(context).pushNamedAndRemoveUntil(
              //       ()=>MaterialPageRoute(builder: (context)) {
              //         return MyHomePage(title:'title');},
              //         (_)=>false
              //         );
            },
          ),
        ]));
  }
}
