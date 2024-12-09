import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage {(Key? Key)} : (key: key);

  @override
  State<> createState() => _State();
}

class _State {
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['Turkish','English','Marathi'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController LanguageController = TextEditingController();
void  translate(String src, String dest, String input) async{
  GoogleTranslator translator =  new GoogleTranslator()
var translation = await translator.translate(input,from:src,to:dest);
  setState(() {
    output=translation.text.toString();
  });
  if (src=='--' dest =='--'){
    setState(() {
      output = "Fail to translate";
    });
}
}
String getLanguageCode(String lanuage){
if(language=="English"){
return "en";
}else if(language=="Turkish"){
return "tur";
}else if (language=="Arabic")
return "ar";
}
return "--";

}



@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xff10223d),
appBar: AppBar(
title: Text("Language Translator"),centerTitle: true,
backgroundColor : Color(0xff10223d),
elevation: 0,),
),
body: Center(
     child: SingleChildScrollView(
         child: Column(
         children: [
           SizedBox(height: 50,),
            Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
  DropdownButton(
focusColor: Colors.white,
iconDisabledColor: Colors.white,
iconEnabledColor: Colors.white,
hint: Text(
 originLanguage,style: TextStyle(color: Colors.white),
),
dropdownColor:  Colors.white,
icon: Icon(Icons.keyboard_arrow_down),
items: languages.map((String dropDownStringItem){
  return DropdownMenuItem(child:Text(dropDownStringItem),
  value: dropDownStringItem,)

}).toList(),
onChanged: (String? value){
    setState(() {
      originLanguage = value!;

    });
}
)
SizedBox(width: 40,),
Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size:40,),
SizedBox(width,40,), DropdownButton(
focusColor: Colors.white,
iconDisabledColor: Colors.white,
iconEnabledColor: Colors.white,
hint: Text(
originLanguage,style: TextStyle(color: Colors.white),
),
dropdownColor:  Colors.white,
icon: Icon(Icons.keyboard_arrow_down),
items: languages.map((String dropDownStringItem){
return DropdownMenuItem(child:Text(dropDownStringItem),
value: dropDownStringItem,)

}).toList(),
onChanged: (String? value){
setState(() {
destinationLanguage = value!;

});
},
)
],



],
),
SizedBox(height: 40,),
Padding(padding: EdgeInset.all(8)
child:  TextformField(
cursorColor: Colors.white,
autofocus: false,
style: TextStyle(color: Colors.white),
decoration: InputDecoration(
labelText: 'Please enter your text..',
labelStyle: TextStyle(fontSize: 15,color: Colors.white),
border: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.white,
    width: 1
    )

)
),
    enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.white,width: 1),
)
errorStyle: TextStyle(color: Colors.red,fontSize: 15),
), // InputDecoration
controller: languageController,
validator: (value){
  if(value==null || value.isEmpty){
    return 'Please enter text to translate';
}
  return null;

},
)
Padding(padding: EdgeInsets.all(8),
child: ElevatedButton(
  style: ElevatedButton.styleFrom(primary: Color(0xff2b3c5a)),
onPressed: (){
    var language;
    var originLanguage;
    translate(getLanguageCode(originLanguage),getLanguageCode(destinationLanguage),languageController.text.toString())
},
child: Text("Translate")),
),
SizeBox(height:20,),
Text(
"\n$output",
 style: TextStyle(
color: Colors.white,
fontweight: FontWeight.bold,
fontSize: 20),
)

)





]

)
         )
)
);
}

getLanguageCode(originLanguage) {
}
}




