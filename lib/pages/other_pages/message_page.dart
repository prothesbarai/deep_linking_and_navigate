import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_bottombar.dart';
import '../../widgets/custom_floating_button.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  final _formKey = GlobalKey<FormState>();
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
      appBar: CustomAppbar(title: "Message Page"),
      bottomNavigationBar: CustomBottombar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              decoration: BoxDecoration(color: Color(0xfffafafa),),
              child: Form(
                key: _formKey,
                child: Theme( // Over All Input Field Decoration Use Theme And Property
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff2f2f2f),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff40c2e2),width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2,style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
                      labelStyle: TextStyle(color: Color(0xff2f2f2f)),

                      floatingLabelStyle: WidgetStateTextStyle.resolveWith((state){
                        if(state.contains(WidgetState.error)){return TextStyle(color: Colors.red);}
                        if(state.contains(WidgetState.focused)){return TextStyle(color: Color(0xff40c2e2));}
                        return TextStyle(color: Colors.black);
                      }),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: getTextController,
                        autocorrect: true,
                        keyboardType: TextInputType.text,
                        cursorColor: Color(0xff40c2e2),
                        decoration: InputDecoration(
                          hint: Text("Enter Your Text",style: TextStyle(color: Colors.grey),),
                          labelText: "Message",
                          suffixIcon: ValueListenableBuilder<TextEditingValue>(
                              valueListenable: getTextController,
                              builder: (context, value, child) {
                                if(value.text.isEmpty){return SizedBox.shrink();}
                                return IconButton(onPressed: ()=> getTextController.clear(), icon: Icon(Icons.close,color: Color(0xff40c2e2),));
                              },
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "Your Field is Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: getValueController,
                        autocorrect: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(2)],
                        cursorColor: Color(0xff40c2e2),
                        maxLength: 2,
                        decoration: InputDecoration(
                          hint: Text("Enter Your Number",style: TextStyle(color: Colors.grey),),
                          labelText: "Value",
                          suffixIcon: ValueListenableBuilder(
                              valueListenable: getValueController,
                              builder: (context, value, child) {
                                if(value.text.isEmpty){return SizedBox.shrink();}
                                return IconButton(onPressed: ()=> getValueController.clear(), icon: Icon(Icons.close,color: Color(0xff40c2e2),));
                              },
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "Your Field is Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      ElevatedButton(
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            if(_formKey.currentState!.validate()){

                            }
                          },
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Text("Submit")
                      ),
                    ],
                  ),
                ),
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
        ),
      ),
    );
  }
}
