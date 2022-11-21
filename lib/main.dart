import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


Future<Album> fetchAlbum() async{
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
     if(response.statusCode == 200){
         return Album.fromJson(jsonDecode(response.body));
     }
     else{
       throw Exception('Failed to load');
     }
     class Album{
       final int userId;
       final int id;
       final String title;

       const Album({
         required this.userId;
         required this.id;
         required this.title;
       });

       factory Album.fromJson(Map<String, dynamic> json) {
        return Album(
          userId: json['userId'],
          id:json['id'],
          title:json['title'],
        );
       }
     }
     void main()
     {
       runApp(Myt1);
     }
     class Myt1 extends StatefulWidget {
       const Myt1({Key? key}) : super(key: key);

       @override
       State<Myt1> createState() => _Myt1State();
     }

     class _Myt1State extends State<Myt1> {
       late Future<Album> futureAlbum;

       @override
  void initState() {
         super.initState();
         futureAlbum = fetchAlbum();
       }
       @override
       Widget build(BuildContext context) {
         return MaterialApp(
           title:'hi',
           theme: ThemeData(
             primarySwatch: Colors.blue,
           ),
           home: Scaffold(
             appBar: AppBar(
               title: const Text('Welcome'),
             ),
             body: Center(
               child: FutureBuilder<Album>(
                   future:futureAlbum,

             ),


           ),
         );
       }
     }
