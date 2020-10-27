
import 'package:flutter/material.dart';
import 'dart:math';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();

  int _genderradiovalue, _ageradiovalue;
  int value;
  double weight,height,result;
  double BoerMale,BoerFemale,JamesMale,JamesFemale,HumeMale,HumeFemale,petersBoth;
  double pBothBodyFat, bMaleBodyFat,bFemaleBodyFat, jMaleBodyFat, jFemaleBodyFat, hMaleBodyFat, hFemaleBodyFat;
  String peters, boer, james, hume, pBF, bBF, jBF, hBF;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor:Colors.pink[50],
        appBar: AppBar(
          title: Text('Lean Body Mass Calculator'),
          backgroundColor: Colors.red[400],
        ),
        
          body:Column
          (
            children:<Widget> 
          [
            ButtonBar
          (
            alignment:MainAxisAlignment.center,
            
            children:<Widget>
            [
              Row
            (
                  children:
                [
                  Text("Gender",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width:10),
                  Radio
                  (
                    value:0,
                    activeColor: Colors.redAccent,
                    groupValue: _genderradiovalue,
                    onChanged:((int value) {
                          onChanged(value);
                        }),
                  ),
                  Text("Male"),
                  Radio
                  (
                    value:1,
                    activeColor: Colors.redAccent,
                    groupValue: _genderradiovalue,
                    onChanged:((int value) {
                          onChanged(value);
                        }),
                  ),
                  Text("Female"),
                  
                ]),


                Row(
                  children:
                [
                  Text("Age 14 or younger?",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width:10),
                  Radio
                  (
                    value:2,
                    activeColor: Colors.redAccent,
                    groupValue: _ageradiovalue,
                    onChanged:((int value) {
                        onChanged2(value);
                      }),
                  ),
                  Text("Yes"),
                  Radio
                  (
                    value:3,
                    activeColor: Colors.redAccent,
                    groupValue: _ageradiovalue,
                    onChanged:((int value) {
                        onChanged2(value);
                      }),
                  ),
                  Text("No"),
                ]),


                Row(
                  children:
                [
                  Text("Height",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width:10),
                  Container(width:150,height:25,child:TextField(decoration:InputDecoration(hintText:"cm"),controller:_heightcontroller,
                  keyboardType: TextInputType.numberWithOptions(),)),
                ]),


                Row(
                  children:
                [
                  Text("Weight",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width:10),
                  Container(width:150,height:25,child:TextField(decoration:InputDecoration(hintText:"kg"),controller:_weightcontroller
                    ,keyboardType: TextInputType.numberWithOptions(),)),
                ]),

                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: 
                  [
                    
                    OutlineButton
                    (
                      child:Text("Calculate"),
                      onPressed: _calculateButton,
                    ),
                    SizedBox(width:10),
                    OutlineButton
                    (
                      child:Text("Clear"),
                      onPressed:_clearButton,
                    )
                  ]
                ),
              ]
            ),
            
            Container
            (
              child:SizedBox(width:100, height:50),
            ),
            
            Container(
              //color:Colors.white,
              padding:const EdgeInsets.all(5.0),
              //decoration:BoxDecoration(border:Border.all(width:1,color:Colors.black)),
              decoration:BoxDecoration(border:Border(left:BorderSide(color:Colors.black,width:3.0),top:BorderSide(color:Colors.black,width:3.0,))),
                 
              child:Text("Result     ",textAlign:TextAlign.center,style:TextStyle(fontSize:15, fontWeight: FontWeight.bold))),
              
            
            Container
                (
                  margin:const EdgeInsets.all( 5.0),
                  //padding:const EdgeInsets.all(10.0),
                  //decoration:BoxDecoration(border:Border.all(width:3,color:Colors.black)),
                  
                  child:Table
                (
                  border:TableBorder.all(color:Colors.black),
                  columnWidths: 
                  {
                    0:FixedColumnWidth(90.0),
                    1:FixedColumnWidth(125.0),
                    2:FixedColumnWidth(75.0),
                  },
                  children: 
                  [
                    TableRow
                    (
                      children:
                      [
                        Text('Formula',textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                        Text('Lean Body Mass (kg)',textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                        Text('Boday Fat (%)',textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold)),
                      ],

                    ),
                    TableRow
                    (
                      children:
                      [
                        Text(' Peters            (for Children)',maxLines:2,overflow:TextOverflow.ellipsis),
                        Text('$peters',textAlign:TextAlign.center),
                        Text('$pBF',textAlign:TextAlign.center),
                      ]
                    ),
                    TableRow
                    (
                      children: 
                      [
                        Text(' Boer'),
                        Text('$boer',textAlign:TextAlign.center),
                        Text('$bBF',textAlign:TextAlign.center),
                      ]
                    ),
                    TableRow
                    (
                      children: 
                      [
                        Text(' James'),
                        Text('$james',textAlign:TextAlign.center),
                        Text('$jBF',textAlign:TextAlign.center),
                      ]
                    ),
                    TableRow
                    (
                      children: 
                      [
                        Text(' Hume'),
                        Text('$hume',textAlign:TextAlign.center),
                        Text('$hBF',textAlign:TextAlign.center),
                      ]
                    ),
                  ],
                ),
                ),
                
         ]
            
            
          
      ),
      
      ),
    );
  }

  void onChanged(int value)
  {
    setState(() 
    {
       _genderradiovalue = value;
    });
  }

  void onChanged2(int value)
  {
    setState(() 
    {
       _ageradiovalue = value;
    });
  }
  
  void _clearButton() 
  {
    setState(() 
    {
        _genderradiovalue = 0;
        _ageradiovalue = 0;
        _weightcontroller.clear();
        _heightcontroller.clear();

        peters = "—";
        pBF = "—";
        boer = "—";
        bBF = "—";
        james = "—";
        jBF = "—";
        hume = "—";
        hBF = "—";
    }
    );
  }

  void _calculateButton() 
  {
    setState(() 
    {
    height = double.parse(_heightcontroller.text);
    weight = double.parse(_weightcontroller.text);


    petersBoth = 3.8*(0.0215*(pow(weight,0.6469))*(pow(height,0.7236)));
    pBothBodyFat = 100-(petersBoth/weight)*100;

    BoerMale = ((0.407*weight)+(0.267*height))-19.2;
    bMaleBodyFat = 100-(BoerMale/weight)*100;
    BoerFemale = ((0.252*weight)+(0.473*height))-48.3;
    bFemaleBodyFat = 100-(BoerFemale/weight)*100;

    JamesMale = (1.1*weight)-(128*((weight/height)*(weight/height)));
    jMaleBodyFat = 100-(JamesMale/weight)*100;
    JamesFemale = (1.07*weight)-(148*((weight/height)*(weight/height)));
    jFemaleBodyFat = 100-(JamesFemale/weight)*100;

    HumeMale = (0.32810*weight)+(0.33929*height)-29.5336;
    hMaleBodyFat = 100-(HumeMale/weight)*100;
    HumeFemale = (0.29569*weight) + (0.41813*height)-43.2933;
    hFemaleBodyFat = 100-(HumeFemale/weight)*100;

    if(_ageradiovalue == 2)
    {
      if(_genderradiovalue==0)
      {
        peters = petersBoth.toStringAsFixed(2);
        pBF = pBothBodyFat.toStringAsFixed(2);

        boer = "—";
        bBF = "—";
        james = "—";
        jBF = "—";
        hume = "—";
        hBF = "—";
      }
      else if(_genderradiovalue==1)
      {
        peters = petersBoth.toStringAsFixed(2);
        pBF = pBothBodyFat.toStringAsFixed(2);

        boer = "—";
        bBF = "—";
        james = "—";
        jBF = "—";
        hume = "—";
        hBF = "—";
      }
    }
    else if(_ageradiovalue==3)
    {
      if(_genderradiovalue==0)
      {
        peters = "—";
        pBF = "—";

        boer = BoerMale.toStringAsFixed(2);
        bBF = bMaleBodyFat.toStringAsFixed(2);
        james = JamesMale.toStringAsFixed(2);
        jBF = jMaleBodyFat.toStringAsFixed(2);
        hume = HumeMale.toStringAsFixed(2);
        hBF = hMaleBodyFat.toStringAsFixed(2);
      }
      else if(_genderradiovalue==1)
      {
        peters = "—";
        pBF = "—";

        boer = BoerFemale.toStringAsFixed(2);
        bBF = bFemaleBodyFat.toStringAsFixed(2);
        james = JamesFemale.toStringAsFixed(2);
        jBF = jFemaleBodyFat.toStringAsFixed(2);
        hume = HumeFemale.toStringAsFixed(2);
        hBF = hFemaleBodyFat.toStringAsFixed(2);

      }
    }




    });
    
  }


}