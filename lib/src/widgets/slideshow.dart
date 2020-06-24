import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Slideshow extends StatelessWidget {
  
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color coloSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario= Colors.redAccent,
    this.coloSecundario= Colors.greenAccent,
    this.bulletPrimario= 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {


  return ChangeNotifierProvider(
    create: (_) => _SlideshowModel(),
        child: SafeArea(
                  child: Center(
                child: Builder(
                  builder: (BuildContext context){
                    
                    Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
                    Provider.of<_SlideshowModel>(context).colorSecundario = this.coloSecundario;

                    Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
                    Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;
                    

                    return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
                  },
              )
          ),
        ),
  );

  }
  
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /* _Dots(this.slides.length), */
        if(this.puntosArriba) 
        _Dots(this.slides.length/* ,this.colorPrimario,this.coloSecundario */),

        Expanded(
          child: _Slides(this.slides)
        ),

        if(!this.puntosArriba) 
        _Dots(this.slides.length/* ,this.colorPrimario,this.coloSecundario */),
      ],
    );
  }
}
class _Dots extends StatelessWidget {

  final int totalSlides;
 /*  final Color colorPrimario;
  final Color coloSecundario; */

  _Dots(this.totalSlides)/* ,this.colorPrimario,this.coloSecundario) */;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index/* ,this.colorPrimario,this.coloSecundario */)),
        /* children: <Widget>[

          _Dot(0),
          _Dot(1),
          _Dot(2),
          _Dot(3),
          _Dot(4),
          
        ], */
      ),
    );
  }
}

class _Dot extends StatelessWidget {  

  final int index;
  /* final Color colorPrimario;
  final Color coloSecundario; */

  _Dot(this.index/* ,this.colorPrimario,this.coloSecundario */);

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;

    if(ssModel.currentPage >=  index -0.5 && ssModel.currentPage < index + 0.5){
        tamano =  ssModel.bulletPrimario;
        color=ssModel.colorPrimario;
    }else{
        tamano =  ssModel.bulletSecundario;
        color=ssModel.colorSecundario;
    }
    

    return Container(
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal:5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

 @override
  void initState() {
  super.initState();


    pageViewController.addListener(() { 
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page ;
    });

  }



  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(/* 
      padding: EdgeInsets.all(10), */
      child: PageView(
        controller: pageViewController,        
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
      
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {

    /* return SvgPicture.asset('assets/1_seleccionar.svg'); */
    return Container(
          width: double.infinity,
          height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario= 12.0;
  double  _bulletSecundario = 12.0;



  double get currentPage  => this._currentPage;

  set currentPage(double pagina){

    this._currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set  colorPrimario(Color color){
    this._colorPrimario = color;
    
  }

  Color get colorSecundario => this._colorSecundario;
  set  colorSecundario(Color color){
    this._colorSecundario = color;
   
  }

  double get bulletPrimario => this._bulletPrimario;
  set  bulletPrimario(double tamano){
    this._bulletPrimario = tamano;
    
  }

  double get bulletSecundario => this._bulletSecundario;
  set  bulletSecundario(double tamano){
    this._bulletSecundario = tamano;
 }



}