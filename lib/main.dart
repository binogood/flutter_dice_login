import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: Builder(
        builder:(context) {
          return GestureDetector(
            onTap:(){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50),),
                  Center(
                    child: Image(image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.teal,
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15.0,
                                )
                            )
                        ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  labelText: 'Enter "dice"',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: controller2,
                                decoration: InputDecoration(
                                  labelText: 'Enter "password"',
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(height: 40.0,),
                              ButtonTheme(
                                  minWidth: 100.0,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (controller.text == 'dice' &&
                                          controller2.text == '1234') {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    Dice())
                                        );
                                      } else if(controller.text == 'dice' && controller.text != '1234'){
                                        showSnackBar2(context);
                                      } else if(controller.text != 'dice' && controller.text == '1234'){
                                        showSnackBar3(context);
                                      } else {
                                        showSnackBar(context);
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 35.0,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orangeAccent,
                                    ),
                                  )
                              )
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}

void showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '로그인 정보 확인',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar2(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '비밀번호가 불일치',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar3(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '아이디 불일치',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}