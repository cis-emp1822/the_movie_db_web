import 'package:flutter_web/material.dart';
import 'SearchScreen.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MovieDetailsPageFormal extends StatefulWidget {


  MovieDetailsPageFormal();


  @override
  State<StatefulWidget> createState() => new _MovieDetailsPageFormalState();

}


class _MovieDetailsPageFormalState extends State<MovieDetailsPageFormal> {

  GlobalKey<ScaffoldState> key = new GlobalKey();
   Map<String, dynamic> movieData;
 final String url = "https://api.themoviedb.org/3/movie/" + SearchScreen.movieNumber.toString() + "?api_key=3fc19a9f5b408d99ba4d3efb472f4ca0&language=en-US";
  Future<Map<String, dynamic>> getJSONData(  ) async { 
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
    return  movieData = dataConvertedToJSON;
     });

   return movieData;

  }
    urlBackdrop(){
    String url ="https://image.tmdb.org/t/p/w500" + "/lyv5TfzTcqdS212LUMzUPk8lJeB.jpg";
    //movieData.putIfAbsent("backdrop_path", () => "/lyv5TfzTcqdS212LUMzUPk8lJeB.jpg" );
    try {
      if(movieData['backdrop_path']==null)
      {
     return url;
      }
      else
  return url = "https://image.tmdb.org/t/p/w500" +  movieData['backdrop_path'].toString();
  } catch ( e )
  {
    print(e.toString());
    return url;
  }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text("Stamp Collection"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: new SingleChildScrollView(
        child: 
        Center(
           child:  (movieData==null)? new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Padding(
              padding: EdgeInsets.only( top: 200),
            ), CircularProgressIndicator()]):
          new Padding(
            padding: const EdgeInsets.all(32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Center(
                    
                      child:
                    FadeInImage.assetNetwork(

            placeholder: 'assets/download.png',
            image:urlBackdrop() ,
            alignment: Alignment.center,
            fit: BoxFit.fill,
            
            )

                  ),
                ),
                new SizedBox(height: 16.0,),
                new Text((movieData.containsKey('title')&&['title']!=null)?movieData['title']:"Empty", style: const TextStyle(fontSize: 24.0, fontFamily: "CrimsonText"),),
                new SizedBox(height: 8.0,),
                new Text("", style: const TextStyle(fontSize: 16.0, fontFamily: "CrimsonText", fontWeight: FontWeight.w400),),
                new Divider(height: 32.0, color: Colors.black38,),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new IconButtonText(
                          onClick: (){},
                          iconData: Icons.store,
                          text: movieData['release_date'],
                          
                        ),
                    ),
                    new Expanded(
                      child: new IconButtonText(
                        onClick: (){
                          print("The id is: ${movieData['id']}");
                          
                        },
                        iconData: Icons.local_movies,
                        text: movieData['genres'].isEmpty?"not available":movieData['genres'][0]['name'],
                        
                      ),
                    ),
                    new Expanded(
                      child: new IconButtonText(
                        onClick: (){
                          setState(() {
                            
                          });
                          
                        },
                        iconData:  Icons.stars,
                       text: movieData['popularity'].toString(),
                        
                      ),
                    ),
                  ],
                ),
                new Divider(height: 32.0, color: Colors.black38,),
                new Text("Description", style: const TextStyle(fontSize: 20.0, fontFamily: "CrimsonText"),),
                new SizedBox(height: 8.0,),
                new Text(movieData['overview'], style: const TextStyle(fontSize: 16.0),),
              ],
            ),
          ),
          
           ),
        ),
      
    );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}


class IconButtonText extends StatelessWidget {



  IconButtonText({@required this.onClick, @required this.iconData, @required this.text });


  final VoidCallback onClick;

  final IconData iconData;
  final String text;

 final bool selected = false;

  final Color selectedColor = new Color(0xff283593);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onClick,
      child: new Column(
        children: <Widget>[
          new Icon(iconData, color: selected? selectedColor: Colors.black,),
          new Text(text, style: new TextStyle(color: selected? selectedColor: Colors.black),)
        ],
      ),
    );
  }

}