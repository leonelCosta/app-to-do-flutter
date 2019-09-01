import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        primarySwatch: Colors.red, fontFamily: "Montserrat"
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(     
      body:Stack(
        children: <Widget>[   
            Container(
              height: 35,
              color: Theme.of(context).accentColor,
            ),       
            Positioned(
              right: 20,
              child: Text(
                "6",
                style: TextStyle(fontSize: 200, color: Color(0x10000000)),
                ),
            ),
               _buildMainContent(context),

        ],),
      floatingActionButton: FloatingActionButton(
       onPressed: (){ },
        child: Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), //! Cria o efeito circular com espaço no navBar 
        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //? alinha os filhos de ROW com espaço entre eles
            children: <Widget>[
              
              IconButton( 
                icon: Icon(Icons.settings),
                onPressed: (){}, ),
              IconButton( 
                icon: Icon(Icons.more_vert),
                onPressed: (){}, )

            ],
        ),
      ),


    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[          
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Monday", 
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
        ),

        Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildButton(context), // meus bts
        ), 
        
        _buildTaskUncompleted("Call Tom about appointment"),
        _buildTaskUncompleted("Fix onboarding experience"),
        _buildTaskUncompleted("Edit API documentation"),
        _buildTaskUncompleted("Setup user focus group"),
        Divider(),
        SizedBox(height: 16 ,), // Space here
         _buildTaskCompleted("Have coffee with Sam"),
         _buildTaskCompleted("Meet with Sales")
        
      ],
    );
  }

  Widget _buildTaskUncompleted(String text) {
    return Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
          child: Row(
              children: <Widget>[
                Icon(
                  Icons.radio_button_unchecked,
                  color: Theme.of(context).accentColor,
                  size: 20,
                  ),
                  SizedBox(width: 28,),
                  Text(text)
              ],

          ),
        );
  }

   Widget _buildTaskCompleted(String text) {
    return Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
          child: Row(
              children: <Widget>[
                Icon(
                  Icons.radio_button_checked,
                  color: Theme.of(context).accentColor,
                  size: 20,
                  ),
                  SizedBox(width: 28,),
                  Text(text)
              ],

          ),
        );
  }


//Metodo de crição e estilização dos Buttons
  Widget _buildButton(BuildContext context) {
    return Row(

          children: <Widget>[

              Expanded(
              
                  child: MaterialButton(                  
                  onPressed: (){},
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)) ,
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(14.0),
                  child: Text("Tasks"),
                ),
              ),

              SizedBox( 
                width: 28,
                ),

              Expanded(
                  child: MaterialButton(                  
                  onPressed: (){},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.circular(12)) ,
                  color: Colors.white,
                  textColor:Theme.of(context).accentColor ,
                  padding: const EdgeInsets.all(14.0),
                  child: Text("Events"),
                ),
              )


          ],  

          );
  }
}
