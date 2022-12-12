import 'package:flutter/material.dart';
import 'package:botones/services/mockapi.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {

  
  const ListScreen({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin{
  
  late AnimationController controller, controller2, controller3;
  late Animation colorAnimation, colorAnimation2, colorAnimation3;
  late Animation sizeAnimation, sizeAnimation2, sizeAnimation3;

  
  var valor1=0 ,valor2=0, valor3=0;


  final height = 20;


    @override
  void initState(){
   
    super.initState();
    // Defining controller with animation duration of two seconds
    controller =  AnimationController(vsync: this, duration: const Duration(seconds:1 ));
    controller2 =  AnimationController(vsync: this, duration: const Duration(seconds:1 ));
    controller3 =  AnimationController(vsync: this, duration: const Duration(seconds:1 ));



    // Defining both color and size animations
    colorAnimation = ColorTween(begin: Colors.white, end: Colors.red).animate(controller);
    colorAnimation2 = ColorTween(begin: Colors.white, end: Colors.red).animate(controller2);
    colorAnimation3 = ColorTween(begin: Colors.white, end: Colors.red).animate(controller3);

    sizeAnimation = Tween<double>(begin: 20, end: 300).animate(controller);
    sizeAnimation2 = Tween<double>(begin: 20, end: 300).animate(controller2);
    sizeAnimation3 = Tween<double>(begin: 20, end: 300).animate(controller3);


    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
    controller3.addListener(() {
      setState(() {});
    });







 
  }



  
  
Widget btnTrueno() {
  return GestureDetector(
     
      child: FloatingActionButton(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            onPressed: ()  {
              sizeAnimation = Tween<double>(begin: 1, end: 500).animate(controller);
           
              controller.reset();
              colorAnimation = ColorTween(begin: Colors.green, end: Colors.white).animate(controller);
             
              controller.forward();
         
                MockApi().getFerrariInteger().then((value) => {
          setState(
          ((
                
          ) { 
            
               valor1= value;
        
          })),      
    });
        },
            

        child: const Icon(Icons.flash_on),
        
      ),
  );
}


Widget btnCar(){
  return GestureDetector(
      child: FloatingActionButton(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            onPressed: ()
            
            {

               sizeAnimation2 = Tween<double>(begin: 1, end: 500).animate(controller2);
           
              controller2.reset();
              colorAnimation2 = ColorTween(begin: Colors.orange, end: Colors.white).animate(controller2);
             
              controller2.forward();
         
                MockApi().getFerrariInteger().then((value) => {
          setState((() {
             valor2 =  value;
        }))
    });
        },

        child: const Icon(Icons.airport_shuttle),
        
      ),
  );
}



Widget btnPerson(){
  return GestureDetector(
      child: FloatingActionButton(
            backgroundColor: Colors.red,
            foregroundColor: Colors.black,
            onPressed: (){
              sizeAnimation3 = Tween<double>(begin: 1, end: 500).animate(controller3);
           
              controller3.reset();
              colorAnimation3 = ColorTween(begin: Colors.red, end: Colors.white).animate(controller3);
             
              controller3.forward();
                MockApi().getFerrariInteger().then((value) => {
          setState((() {
             valor3 =  value;
        }))
    });
        },

        child: const Icon(Icons.directions_run),
        
      ),
  );
}


Widget box(){
  return Center(
    child: AnimatedContainer(
      duration: const Duration( milliseconds:100),
      curve: Curves.fastOutSlowIn,
      height: height.toDouble(),
      width: sizeAnimation.value,
      color:  colorAnimation.value,
      ),
  );
}
Widget boxorange(){
  return Center(
    child: AnimatedContainer(
      duration: const Duration( milliseconds:75),
      curve: Curves.fastOutSlowIn,
      height: 20,
      width: sizeAnimation2.value,
      color: colorAnimation2.value,
      ),
  );
}

Widget boxred(){
  return Center(
    child: AnimatedContainer(
      duration: const Duration( milliseconds:55),
      curve: Curves.fastOutSlowIn,
      height: 20,
      width: sizeAnimation3.value,
      color: colorAnimation3.value,
      ),
  );
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: AnnotatedRegion<SystemUiOverlayStyle>(
      
        value: SystemUiOverlayStyle.light , 
        child: GestureDetector(
          
          child: Stack(
            children:<Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[ 
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ]
                 )
              ),
             child: SingleChildScrollView(
               physics: const AlwaysScrollableScrollPhysics(),
               padding: const EdgeInsets.symmetric(
                 horizontal: 25,
                 vertical: 10
               ),
                   child: Column(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: <Widget>[
                  const Text("Async calls",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                  ), 
                  const SizedBox(height: 40),
                  btnTrueno(),
                  box(),
                  Text("$valor1",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                  ),),
                  const SizedBox(height: 6),
                  btnCar(),
                  boxorange(),
                   Text("$valor2",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 50,
                  ),),
                  const SizedBox(height: 6),
                  btnPerson(),
                  boxred(),
                   Text("$valor3",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                  ),),
                 
             
               
    
                ],
                ),
             ),
            )
          ] 
          ),
          ),
          ),
    );
  }
}


