import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatefulWidget{
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> tasklist =[];

  String displaytext =("No text Data");
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do List"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: textcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text("Enter a task")
              ),
            ),
            ),
                
                
                ),

                
            MaterialButton(onPressed:()
            {
              setState(() {
                tasklist.add(textcontroller.text);
                textcontroller.clear();
              });
              
            },
            height: 40,
            color: Colors.white,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            
            child: Text("Add"),
            ),

              ],
            ),

           
            
         Flexible(
           child: ListView.builder(
            itemCount: tasklist.length,
            
            itemBuilder: (context,index){
            
            return  Row(  
                children: [
                  Expanded(
                    child: Container(
                      padding:EdgeInsets.all(10),
                      child:  Text(tasklist[index]),
                       
                    ),
                  ),
              
                  MaterialButton(onPressed: (){
                    setState(() {
                      
                      tasklist.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete,color: Colors.red),
                  )
                ],
              );
           }),
         )
            ]),)
            
          
        )
      ;
  }
}