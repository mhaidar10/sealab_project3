import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;
  Widget myWidget = Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.purple[100],
      border: Border.all(color: Colors.black, width: 3),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Projek switch"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedSwitcher(
                child: myWidget,
                duration: Duration(seconds: 2),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
              Switch(
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red[200],
                  value: isON,
                  onChanged: (newValue) {
                    isON = newValue;
                    setState(() {
                      if (isON)
                      //untuk container to container
                       myWidget = Container(
                         key: ValueKey(1),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        );

                      //untuk container to text
                        /*                     
                       myWidget = Text(
                          "switch: on",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        );
                        */
                      else
                        myWidget = Container(
                          key: ValueKey(2),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        );
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
