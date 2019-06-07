import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/SearchScreen.dart';
import 'dart:convert';
import 'movieDetails.dart';
import 'package:the_movie_db/grid.dart';
/*
void main() {
  runApp(new MaterialApp(
    home: new MyGetHttpData(),
  ));
}*/

// Create a stateful widget
class MyGetHttpData extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => new MyGetHttpDataState();
}

// Create the state for our stateful widget
class MyGetHttpDataState extends State<MyGetHttpData> {
   
  List data;
   final String url = "https://api.themoviedb.org/3/search/movie?api_key=3fc19a9f5b408d99ba4d3efb472f4ca0&language=en-US&query="+ SearchScreen.show + "&page=1&include_adult=false";
  // Function to get the JSON data
  Future<String> getJSONData(  ) async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
    return  data = dataConvertedToJSON['results'];
    });

    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("The Movies DB"),
      ),
      // Create a Listview and load the data when available
      body: Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount:  data == null ? 0 : data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Cell(data[index]),
            onTap: () => {
              SearchScreen.movieNumber = data[index]['id'],
              Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new MovieDetailsPageFormal()),
  )
            }
            ,
          );}
          
    ))
    );
      
        
  }
  
  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}