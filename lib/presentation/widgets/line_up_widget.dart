import 'package:flutter/material.dart';

class LinueUpHome extends StatelessWidget {
  const LinueUpHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 800,
      child:  Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titulares', style: TextStyle(color: Colors.white),),
              Container(
                height: 300,
                width: 200,
                child: ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                  itemCount: 11,
                  itemBuilder: (BuildContext context, int index) {
                    return const Row(
                  children: [
                    Text('1', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(width: 10,),
                    Text('Arquero', style: TextStyle(fontSize: 17, color: Colors.white),),
                  ],
                );
                  },
                ),
              ),
              Text('Suplentes', style: TextStyle(color: Colors.white),),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text('Titulares', style: TextStyle(color: Colors.white),),
              Container(
                height: 300,
                width: 100,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 11,
                  itemBuilder: (BuildContext context, int index) {
                    return const Row(
                  children: [
                    Text('1', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(width: 10,),
                    Text('Arquero', style: TextStyle(fontSize: 17, color: Colors.white),),
                  ],
                );
                  },
                ),
              ),
              Text('Suplentes', style: TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }
}