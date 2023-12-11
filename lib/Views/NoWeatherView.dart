import 'package:flutter/cupertino.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(

          child: Text("There is no weather 😔 start",
            style: TextStyle(fontSize: 24,),),
        ),
        Center(

          child: Text("searching now 🔍",
            style: TextStyle(fontSize: 24,),),
        ),
      ],)
    );
  }
}
