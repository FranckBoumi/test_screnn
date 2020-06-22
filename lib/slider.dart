import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  final int _numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator (){
    List<Widget> list = [];
    for( int i =0;i<_numPage;i++){
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActivate){
    return AnimatedContainer(duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActivate ? 24.0 : 16.0,
      decoration: BoxDecoration(color: isActivate ? Colors.pink : Colors.grey,borderRadius: BorderRadius.all(Radius.circular(12.0)))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1,0.4,0.7,0.9],
            colors: [
               Colors.black12,
               Colors.grey,
               Colors.blueGrey,
               Colors.white
            ]
           )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: ()=> print('Passer'),
                    child: Text('Passer',style: TextStyle(color: Colors.pink,fontSize: 20.0),),
                  ),
                ),
                Container(
                  height: 400.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page){
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Icon(Icons.cake,size: 150.0,color: Colors.pink,)
                            ),
                            SizedBox(height: 20.0),
                            Center(child: Text('Birth Day Light',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold))),
                            SizedBox(height: 10.0),
                            Center(child: Text('La façon la plus simple de souhaiter un joyeux anniversaire à vos proche ',style: TextStyle(fontSize: 10.0),))

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Icon(Icons.play_circle_outline,size: 150.0,color: Colors.pink,)
                            ),
                            SizedBox(height: 10.0),
                            Center(child: Text('Les meilleurs images et videos chez vous',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold))),
                            SizedBox(height: 10.0),
                            Center(child: Text('Personnalisez les images et vidéos pour les envoyer à vos proches',style: TextStyle(fontSize: 10.0),))

                          ],
                        ),
                      ),Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                                child: Icon(Icons.card_giftcard,size: 150.0,color: Colors.pink,)
                            ),
                            SizedBox(height: 10.0),
                            Center(child: Text('Des Cadeaux\nExceptionnels ',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold))),
                            SizedBox(height: 10.0),
                            Center(child: Text('Offrez des cadeaux spéciaux à ceux qui vous sont chers !!!',style: TextStyle(fontSize: 10.0),))

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != 2 ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Next',style: TextStyle(color: Colors.pink, fontSize: 22.0),),
                            SizedBox(width: 10.0),
                            Icon(Icons.arrow_forward,color: Colors.pink,size: 30.0),
                            
                          ],
                        ),
                      ),
                    )
                )
                    :Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPage - 1 ? Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.pink,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('Commencer', style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ) 
          : Text(''),
    );
  }
}
