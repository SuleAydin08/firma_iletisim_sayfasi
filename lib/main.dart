import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  //bu widget tipi kullanıcı veya başka bir elemanla etkileşime girmeyen ekrana durağan bir şey çizen widget tipleridir.
  @override
  Widget build(BuildContext context) {
    //runAppde yazdığımız benimuygmı bağlamak için yaptığımız bağlantıdır.
    return MaterialApp(
      //bağlantı yapmak istediğimiz kısmı returnden sonra bağlayıp devam ederiz ve bağlantı yapmış oluruz.
      home: Scaffold(
        backgroundColor: Colors.lime,
        body: SafeArea(
          child: Column(
            children: [
              Transform(
                transform: Matrix4.rotationZ(-0.2),
                alignment: FractionalOffset.center,
              ),
              PlanetContainerWidget(
                text: 'Kod',
                icon: Icons.language,
              ),
              PlanetContainerWidget(
                text: 'Planet',
                icon: Icons.person,
              ),
            ],
          ), //containerı ekranda döndürmeye yarar.
        ), //kod böyle olduğunda wifi veya operatörden dolayı görüntülenmede sıkıntı olabilir bu sebeple safeArea diye bir özellik vardır.
      ),
    ); //tüm widgetler büyük harfle başlar ve pascal case dediğimiz yazım tekniğiyle yazılır.ilk harfler büyük yazılır.
  } //conteiner kapsayan eden bütün widgetları içerisine alan bir kapsayıcıdır.webde div gibi düşünülebilir.
}

class PlanetContainerWidget extends StatelessWidget {
  PlanetContainerWidget({super.key, required this.text, required this.icon});
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      //transform: Matrix4.rotationZ(-0.2),
      width: 200,
      height:
          100, //sayfanın hepsini kaplamasını istemezsek height ve width ekleriz.
      alignment: Alignment
          .bottomRight, //bottomright burda içerisindeki yazının konumlanacağı yerdir.alignment kullandığımız zaman conteinarı sayfada istediğimiz gibi konumlandırabiliyoruz.ama bunu verdiğimiz zaman containerı widht ve height olarak bu değerlei belirtmemiz gerekir.
      decoration: BoxDecoration(
        shape: BoxShape
            .rectangle, //border radius circular olduğu zaman burası oval olamaz.border radius int sayıda kabul eder int double yuvarlıyor.
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(16.0),
      ), //decoration kullanıldığı zaman color decoration içinde kullanılması gerekir
      margin: EdgeInsets.all(16.0),//elemanın dört bir yerinden verilen mesafeyi listeler, eger belirttiğimiz taraftan mesafe vermesini istersek edgeInsets.only(left:12, top:25) olarak yazılır.
      padding: EdgeInsets.all(26.0),//elemanın dört bir yerinden verilen mesafeyi listeler
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          Text(text),//eğer texti conteiner içerisinde döndürmek için transformırı conteiner tarafından sileriz ve text transformırla çevreleriz peki tüm transformırları silmek için ampule basarak remove this widget deriz.
        ],
      ), //bu kod kod planet yazısının yukarıya aşırı derecede yapışık olmasını engeller.
    );
  }
}
//texti döndürmek için child:transform(child:text('kod planet'),
//transform:Matrix4 .rotationZ(-0.2),
//alignment:FrantionalOffset.center,)dediğimizde conteiner içerisindeki texti yamuk olarak yazmış oluruz.
//EdgeInserts.symmetric(vertical:30, horizontal:35) ile dikey veya yatay simetrileme yapabiliriz.
//mesafeyi hızlı ve sipesifik olarak atamak için ise edgeınsert.fromLTRB(left,top,right,bottom)