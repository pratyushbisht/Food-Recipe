import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String ThumbnailUrl;

  const RecipeCard({Key key, this.title, this.rating, this.cookTime, this.ThumbnailUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical:10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0,0),
            blurRadius: 10,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(ThumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
     child: Stack(
       children: [
         Align(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 5.0),
             child: Text(
               title,
               style: TextStyle(fontSize: 19),
               overflow: TextOverflow.ellipsis,
               maxLines: 2,
               textAlign: TextAlign.center,

             ),
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               padding: EdgeInsets.all(5),
               margin: EdgeInsets.all(5),
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.4),
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Row(
                 children: [
                   Icon(Icons.star,color: Colors.yellow,size: 18,),
                   SizedBox(width: 7,),
                   Text(rating),
                 ],
               ),
             ),
             Container(
               padding: EdgeInsets.all(5),
               margin: EdgeInsets.all(5),
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0.4),
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Row(
                 children: [
                   Icon(Icons.schedule,color: Colors.yellow,size: 18,),
                   SizedBox(width: 7,),
                   Text(cookTime),
                 ],
               ),
             ),

           ],
         )
       ],

     alignment: Alignment.bottomLeft,

     ),



    );
  }
}
