import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: SizedBox(
          width: MediaQuery.of(context).size.width,//기존에 사용 했던 double.infinity 보다 더 많이 사용 되고 제어 하기 쉬운 형태 
          child: Column(
            children: [

              _top(selectedTime: selectedTime,
              onPressed: (){
                onHeartPressed();
              },
              ),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }


  onHeartPressed(){
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedTime,// 선택했던 날자 시점에서 초기회 됨.
              maximumDate: DateTime.now(),//선택 할 수있는 낳자 제한 코드
              onDateTimeChanged: (DateTime date){
                setState(() {
                  selectedTime = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}

class _top extends StatefulWidget {
  final DateTime selectedTime;
  final VoidCallback? onPressed;

  const _top({
    required this.selectedTime,
    required this.onPressed,
    super.key
  });

  @override
  State<_top> createState() => _topState();
}

class _topState extends State<_top> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Expanded(//expanded 를 사용 하면 원하는 비율 만틈 나누는 것이 가능 했었음.
      child: Container(
        child: Column(
          children: [

            Text('U&I',
              style: Theme.of(context).textTheme.displayLarge,
            ),

            Text('우리 처음 만난 날 ',
              style: Theme.of(context).textTheme.displayMedium,
            ),

            Text('${widget.selectedTime.year}.${widget.selectedTime.month}.${widget.selectedTime.day}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            IconButton(
              iconSize: 60,
              color: Colors.red,
              onPressed: widget.onPressed,
              icon: Icon(
                  Icons.favorite
              ),
            ),

            Text('D+${now.difference(widget.selectedTime).inDays + 1 }',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}


class _bottom extends StatelessWidget {
  const _bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        child: Image.asset(
            'asset/img/middle_image.png'
        ),
      ),
    );
  }
}

