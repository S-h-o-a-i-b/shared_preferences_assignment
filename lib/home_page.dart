
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();

  String n ="";
  String em="";
  String pass = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadNumber();
  }

  void loadNumber() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     String name = pref.getString("name") ?? "";
     String email = pref.getString("email") ?? "";
     String password = pref.getString("password") ?? "";

     n = name;
     em = email;
     pass = password;

     c1.text = n;
     c2.text = em;
     c3.text = pass;
     setState(() {

     });
  }

  Future<void> show(String name, String email,password) async {

    n = name;
    em = email;
    pass = password;


    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", n);
    pref.setString("email", em);
    pref.setString("password", pass);

    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
      return(Scaffold(

        appBar: AppBar(
          title: Text("HomePage"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,


        ),

        body: Padding(padding: EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: c1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: "Enter Username",


                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: c2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    labelText: "Enter Email",



                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: c3,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Enter Password",




                  ),
                ),
              ),

              SizedBox(height: 10,),

              ElevatedButton.icon(onPressed: (){

                String name = c1.text;
                String email = c2.text;
                String password = c3.text;

                if(!email.isEmail){
                  Get.snackbar("Error", "Enter valid Email");
                }

                else if(name.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
                  show(name, email,password);
                }

                else{
                  Get.snackbar("Error", "Enter valid name or Email");
                }


              },
                label: Text("Save"),
                icon: Icon(Icons.save),


              ),
              SizedBox(height: 10,),
              Text(n,style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),

              SizedBox(height: 10,),
              Text(em,style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),








            ],
          ),

        ),

      ));
  }
}