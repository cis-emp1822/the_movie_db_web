import 'package:flutter_web/material.dart';
import 'package:the_movie_db/myapp.dart';
class SearchScreen extends StatelessWidget {
  final TextEditingController controller1 = new TextEditingController();
  static String show = "";
 static int movieNumber ;
 
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Search Movies"),
      ),
      body: new Container(
      padding: const EdgeInsets.all(18.0),
      child: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            new TextField(
              decoration: new InputDecoration( hintText: "search movies here... " , hintStyle: new TextStyle(
      fontSize: 25.0,
      color: Colors.black,
    ),),
              textInputAction: TextInputAction.next,
              style:  new TextStyle(
      fontSize: 25.0,
      color: Colors.black87,
    ), 
  
               onSubmitted:(String str ) {
                 
                 
                 Navigator.push(
    ctxt,
    new MaterialPageRoute(builder: (ctxt) => new MyGetHttpData()),
  );
               },
               onChanged: (String str){
                show = str ;
               },
              controller: controller1,
            ),
            SearchScreen.show==""?
             new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: ( ) {
                 
                 
                 Navigator.push(
    ctxt,
    new MaterialPageRoute(builder: (ctxt) => new MyGetHttpData()),
  );
               }
                 ,
                    child: new Text("Search"),
                  ) :Icon(Icons.copyright)  ,
            Padding(padding: EdgeInsets.all(10),)
            ,
          ]
    )),
    decoration: new BoxDecoration(
              image: new DecorationImage(
                  // Load image from assets
                  image: new AssetImage('assets/screen.jpg'),
                  // Make the image cover the whole area
                
                  fit: BoxFit.cover)),
    
    
    ),
    
     
        
    
    );
    
  }
}