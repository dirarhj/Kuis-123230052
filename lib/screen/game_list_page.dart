import 'package:flutter/material.dart';
import 'package:kuis/models/game_data.dart';
import 'package:kuis/screen/game_detail_page.dart';
// import 'package:kuis/screen/profile_page.dart';

class GameListPage extends StatefulWidget {
  final String username;
  const GameListPage({super.key, required this.username});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {

  // void _profile(){
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ProfilePage(username: userC.text,)));
  // }

  @override
  List<bool> savedGames = List.generate(gameList.length, (index) => false);
  final List<GameStore> games = gameList;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, ${widget.username}!",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      // leading: Image.network(
                        // game.imageUrls,
                        // width: 50,
                        // height: 70,
                        // fit: BoxFit.cover,
                      // ),
                      title: Text(
                        "${game.name}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${game.price}",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameDetailPage(game: game),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              //fungsinya ini boss
              onPressed: (){}, 
              //styling button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45)
              ),
              child: Text('Profile')
              ),
          ],
        ),
      ),
    );
  }
}
