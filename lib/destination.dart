import 'package:flutter/material.dart';
import 'settingtime.dart';

class Destination extends StatefulWidget {
  final String title;
  const Destination({super.key, required this.title});

  @override
  State<Destination> createState() => _Destination();
}

class _Destination extends State<Destination> {
  final List<String> items = ['大学', '最寄り駅', 'バイト先', 'カフェ', 'サポーターズ'];
  var currentLocation = '';
  var destination = '';

  late String state;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    state = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(state),
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
                        Container(child: Text('現在地')),
                        ElevatedButton(
                          onPressed: () {
                            // ボタンが押された時の処理
                            print('Buftton $index pressed!');
                            // print('Button $items[$index] pressed!');
                            print(items[index]);
                            currentLocation = items[index];
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
                        currentLocation = items[index];
                      },
                      child: Text(items[index]),
                    );
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // Container:Text('現在地'),

                  children: List.generate(items.length, (index) {
                    if (index == 0) {
                      return Column(children: [
                        Container(child: Text('到着地')),
                        ElevatedButton(
                          onPressed: () {
                            // ボタンが押された時の処理
                            print('Buftton $index pressed!');
                            // print('Button $items[$index] pressed!');
                            print(items[index]);
                            destination = items[index];
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
                        destination = items[index];
                      },
                      child: Text(items[index]),
                    );
                  }),
                ),
              ])),
          ElevatedButton(
            child: Text("時間入力へ"),
            onPressed: () async {
              // "push"で新規画面に遷移
              // リスト追加画面から渡される値を受け取る
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  // 遷移先の画面としてリスト追加画面を指定
                  return SettingTime(
                    title: '時間入力画面',
                    currentLocation: currentLocation,
                    destination: destination,
                  );
                }),
              );
              if (newListText != null) {
                // キャンセルした場合は newListText が null となるので注意
              }
            },
          ),
        ]));
  }
}
