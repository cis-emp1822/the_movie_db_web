import 'package:flutter_web/material.dart';
class Cell extends StatelessWidget {
  const Cell(this.cellModel);
  @required
  final dynamic cellModel;
  void changeBG(){
    if(cellModel['image_url']==null)
    cellModel['image_url'] = "https://netflixroulette.files.wordpress.com/2013/01/image-not-found.gif";
  }
  @override
  Widget build(BuildContext context) {
      changeBG();
    return Center(
      child: Container(
        child: Padding(
          padding:
              new EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
           
                 FadeInImage.assetNetwork(

          placeholder: 'assets/download.png',
          image: cellModel['image_url'],
          //"https://image.tmdb.org/t/p/w500" + cellModel['poster_path'],
          width: MediaQuery.of(context).size.width*0.28,
          height: MediaQuery.of(context).size.height*0.18,
          alignment: Alignment.center,
          fit: BoxFit.fill,
          
          ),
          
  

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text( 
                  cellModel['title'],
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}