import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(left:10.0, right: 10.0, bottom: 20,top: 80),
              child: Image.asset('lib/images/ovacado.jpg', height: 200, width: 300,),
            ),
        
           
            //we deliver grocery at you do steps
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('We deliver groceries at your doorsteps',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize:35,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
        
            //get started button.
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomeScreen();
              }),),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}