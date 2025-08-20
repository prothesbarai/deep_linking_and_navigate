import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:deep_linking_and_navigate/widgets/custom_bottombar.dart';
import 'package:deep_linking_and_navigate/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController getTextController = TextEditingController();
  TextEditingController getValueController = TextEditingController();



  @override
  void dispose() {
    getTextController.dispose();
    getValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String text = "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii";

    return Scaffold(
      extendBody: true,
      appBar: CustomAppbar(title: "Home Page"),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottombar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(color: Color(0xfffafafa),),
            child: Column(
              children: [
                TextField(
                  controller: getTextController,
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  cursorColor: Color(0xff40c2e2),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff2f2f2f),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff40c2e2),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                    suffixIcon: Icon(Icons.clear,color: Color(0xff40c2e2),),
                    hint: Text("Enter Your Text",style: TextStyle(color: Colors.grey),),
                    labelText: "Message",
                    labelStyle: TextStyle(color: Color(0xff2f2f2f)),
                    floatingLabelStyle: TextStyle(color: Color(0xff40c2e2)),
                  ),
                  
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: getValueController,
                  autocorrect: true,
                  keyboardType: TextInputType.phone,
                  cursorColor: Color(0xff40c2e2),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff2f2f2f),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff40c2e2),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                    hint: Text("Enter Your Number",style: TextStyle(color: Colors.grey),),
                    labelText: "Value",
                    labelStyle: TextStyle(color: Color(0xff2f2f2f)),
                    floatingLabelStyle: TextStyle(color: Color(0xff40c2e2)),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: Text("Submit")
                ),
              ],
            ),
          ),


          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [

                    SizedBox(height: 20,),

                    for (int i = 0; i <= 50; i++)
                      Text(text),

                  ],
                ),
              )
          )
        ],
      )
    );
  }
}
