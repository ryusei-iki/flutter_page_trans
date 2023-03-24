import 'package:flutter/material.dart';
import 'package:list_button/luggage.dart';

class SettingTime extends StatefulWidget {
  final String title;
  final String currentLocation;
  final String destination;
  const SettingTime(
      {super.key,
      required this.title,
      required this.currentLocation,
      required this.destination});

  @override
  State<SettingTime> createState() => _SettingTime();
}

class _SettingTime extends State<SettingTime> {
  final List<String> items = ['大学', '最寄り駅', 'バイト先', 'カフェ', 'サポーターズ'];
  var timeType = '';
  var setTime = '';
  late String stateTitle;
  late String stateCurrentLocation;
  late String stateDestination;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    stateTitle = widget.title;
    stateCurrentLocation = widget.currentLocation;
    stateDestination = widget.destination;
  }

  TimeOfDay? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateTitle),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // Card(
          //   child: Text('出発時間'),
          //   color: Colors.red,
          // ),
          // Card(
          //   child: Text('到着時間'),
          //   color: Colors.blue,
          // ),
          ElevatedButton(
            onPressed: () {
              timeType = 'start';
            },
            child: Text('出発時間'),
          ),
          ElevatedButton(
            onPressed: () {
              timeType = 'end';
            },
            child: Text('到着時間'),
          )
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedTime == null
                ? const Text(
                    '時間を選択してください',
                    style: TextStyle(fontSize: 30.0),
                  )
                : Text(
                    '${_selectedTime!.hour.toString()}:${_selectedTime!.minute.toString()}',
                    style: const TextStyle(fontSize: 40.0),
                  ),
            const SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
                setTime =
                    '${_selectedTime!.hour.toString()}:${_selectedTime!.minute.toString()}';
              },
              child: const Text(
                '選択する',
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
        ElevatedButton(
            // onPressed: () {
            //   print(timeType);
            //   print(
            //       '${_selectedTime!.hour.toString()}:${_selectedTime!.minute.toString()}');
            //   print(stateCurrentLocation);
            //   print(stateDestination);
            //   Navigator.of(context).popUntil((route) => route.isFirst);
            // },
            onPressed: () async {
              // "push"で新規画面に遷移
              // リスト追加画面から渡される値を受け取る
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  // 遷移先の画面としてリスト追加画面を指定
                  return Luggage(
                    title: '時間入力画面',
                    currentLocation: this.stateCurrentLocation,
                    destination: this.stateDestination,
                    timeType: timeType,
                    setTime:
                        '${_selectedTime!.hour.toString()}:${_selectedTime!.minute.toString()}',
                  );
                }),
              );
              if (newListText != null) {
                // キャンセルした場合は newListText が null となるので注意
              }
            },
            child: Text('持ち物リストへ'))
      ]),
    );
  }

  Future _selectTime(BuildContext context) async {
    final int selectedHour = _selectedTime?.hour ?? 9;
    final int selectedMinute = _selectedTime?.minute ?? 30;
    final initialTime = TimeOfDay(hour: selectedHour, minute: selectedMinute);
    final time = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    } else {
      return;
    }
  }
}
