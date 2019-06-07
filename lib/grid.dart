import 'package:flutter_web/material.dart';
class Cell extends StatelessWidget {
  const Cell(this.cellModel);
  @required
  final dynamic cellModel;
  void changeBG(){
    if(cellModel['poster_path']==null)
    cellModel['poster_path'] = "/lyv5TfzTcqdS212LUMzUPk8lJeB.jpg";
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
          image: "https://image.tmdb.org/t/p/w500" + cellModel['poster_path'],
          width: 150.0,
          height: 150.0,
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