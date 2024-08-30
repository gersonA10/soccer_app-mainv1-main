import 'package:flutter/material.dart';
import 'package:soccer_app/models/fixlineups/lineups_model.dart';

class LinueUpHome extends StatelessWidget {

 final List<ResponseLine>? lineupsResponse;

  const LinueUpHome({
    super.key,
    required this.lineupsResponse
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
              const Text('Titulares', style: TextStyle(color: Colors.white),),
               SizedBox(
                height: 320,
                width: 140,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lineupsResponse?[0].startXi.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    //*Variable separada para obtener al jugador
                    final player = lineupsResponse![0].startXi[index].player;
                    return  Row(
                    children: [
                    Text(player.number.toString(), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
                    const SizedBox(width: 10,),
                    Text(player.name, style: const TextStyle(fontSize: 17, color: Colors.white),),
                  ],
                );
                  },
                ),
              ),
              const Text('Suplentes', style: TextStyle(color: Colors.white),),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Text('Titulares', style: TextStyle(color: Colors.white),),
              SizedBox(
                height: 320,
                width: 150,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lineupsResponse?[1].startXi.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return  Row(
                  children: [
                    Text(lineupsResponse![1].startXi[index].player.number.toString(), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),),
                    const SizedBox(width: 10,),
                    Text(lineupsResponse![1].startXi[index].player.name, style: const TextStyle(fontSize: 17, color: Colors.white),),
                  ],
                );
                  },
                ),
              ),
              const Text('Suplentes', style: TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }
}