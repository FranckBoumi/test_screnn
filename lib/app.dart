import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _indexCourant=0;
  var textfieldVille = new TextEditingController();

  _onClick(int index){
    setState(() {
      _indexCourant=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _ecrans= [
      //futureDesign(),
      //futureDesignMostView(),
      Center(child: Text(" Vous etes dans le suivis des positions !!!")),
      Center(child: Text(" Vous etes dans le suivis des evenements !!!")),
      Center(child: Text(" Vous etes dans le suivis des services!!!")),
    ];

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue.shade900,
        iconTheme: IconThemeData(color: Colors.red),
        title: Padding(
          padding: const EdgeInsets.only(left: 00),
          child: Image.asset(
            "image/you2.png",
            width: 600.0,
            height: 400.0,
          ),
        ),
        actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.videocam),
//              onPressed: () {
//                //startCamera();
//              },
//            ),
          new IconButton(icon: Icon(Icons.search),color: Colors.white, onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: new Text("Search"),
                    content: new Text("Que cherchez-vous?"),
                    actions: <Widget>[
                      new Container(
                        width: 170.0,
                        child: new TextField(
                          controller: textfieldVille,
                        ),
                      ),
                      new RaisedButton(onPressed: (){
                        Navigator.pop(context); // methode permettant de faire disparaitre l'alertdialogue lorsqu'on clique sur ok
                        if(textfieldVille.text.compareTo("")!=0)
                          //mot_rechercher = textfieldVille.text;
                          textfieldVille.clear();
                        setState(() {

                        });



                      },
                        child: Text("OK",style: TextStyle(color: Colors.black,fontSize: 30,),),)
                    ],
                  );
                });
          })

        ],

      ),
//
      body: _ecrans[_indexCourant],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexCourant,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue.shade800,
        onTap: _onClick,
        items: [
          BottomNavigationBarItem(
              title: Text("Accueil",style: new TextStyle(
                fontSize: 10.0,
              ),), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Evenements",style: new TextStyle(
                fontSize:10.0,
              ),), icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              title: Text("Services",style: new TextStyle(
                fontSize: 10.0,
              ),), icon: Icon(Icons.folder)),
        ],
      ),

    );
  }
}
