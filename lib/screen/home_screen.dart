import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              _top(),
              _bottom()
            ],
          ),
        ),
      ),
    );
  }
}

class _top extends StatefulWidget {
  const _top({super.key});

  @override
  State<_top> createState() => _topState();
}

class _topState extends State<_top> {
  DateTime selectedTime = DateTime.now();
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

            Text('${selectedTime.year}.${selectedTime.month}.${selectedTime.day}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            IconButton(
              iconSize: 60,
              color: Colors.red,
              onPressed: (){
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
              },
              icon: Icon(
                  Icons.favorite
              ),
            ),

            Text('D+${now.difference(selectedTime).inDays + 1 }',
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

