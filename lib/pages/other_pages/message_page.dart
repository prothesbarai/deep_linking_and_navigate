import 'package:deep_linking_and_navigate/widgets/custom_appbar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
  String text = "";
  int value = 0;

  String? selectedDropDownItem;
  List<String> dropDownItems = ["Lion", "Tiger", "Elephant", "Zebra", "Giraffe", "Monkey", "Kangaroo", "Panda", "Leopard", "Cheetah", "Bear", "Wolf", "Fox", "Rabbit", "Horse", "Deer", "Camel", "Goat", "Sheep", "Dog", "Cat", "Dolphin", "Whale", "Eagle", "Owl", "Parrot", "Penguin", "Crocodile", "Turtle", "Snake",];


  bool isCheckedPrevious = false;
  bool isCheckedBoth = false;
  bool isCheckedAfter = false;

  @override
  void dispose() {
    getTextController.dispose();
    getValueController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


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
              height: 400,
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
                      isDense: true, // Vertically Compact .. i.e. Remove Default Padding from Vertically

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
                      SizedBox(height: 10,),


                      DropdownButtonFormField2<String>(
                        value: selectedDropDownItem,
                        decoration: InputDecoration(labelText: 'Select Item', contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),),
                        items: dropDownItems.map((item) => DropdownMenuItem<String>(value: item, child: Text(item),)).toList(),
                        onChanged: (value) => setState(() => selectedDropDownItem = value),
                        dropdownStyleData: const DropdownStyleData(maxHeight: 200,),
                        menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 8.0),),
                      ),


                      Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isCheckedPrevious,
                                onChanged: (bool? value){setState(() {isCheckedPrevious = value!;});},
                                checkColor: Colors.white,
                              ),
                              Text("Add Previous")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isCheckedBoth,
                                onChanged: (bool? value){setState(() {isCheckedBoth = value!;});},
                                checkColor: Colors.white,
                              ),
                              Text("Add Both")
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: isCheckedAfter,
                                onChanged: (bool? value){setState(() {isCheckedAfter = value!;});},
                                checkColor: Colors.white,
                              ),
                              Text("Add After")
                            ],
                          ),
                        ],
                      ),


                      SizedBox(height: 15,),
                      ElevatedButton(
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                text = getTextController.text;
                                value = int.tryParse(getValueController.text) ?? 0;
                              });
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
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: value,
                    itemBuilder: (context, index) {
                      return Text(selectedDropDownItem != null ? "$text $selectedDropDownItem" : text);
                    },
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
