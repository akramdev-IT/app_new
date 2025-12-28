import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( // why we use conts here  ? = to optimize performance by reducing rebuilds // لتحسين الأداء عن طريق تقليل عمليات إعادة البناء 
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // why we use conts here  ? = to optimize performance by reducing rebuilds
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        title: const Text("Home" , style: TextStyle(color: Colors.white)),
        centerTitle: true,
       
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings" ),
        ],
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // to align text to the left
          children: [
            const SizedBox(height: 10),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Here's what's happening today:",
              style: TextStyle(color: Color.fromARGB(179, 66, 64, 64)),
            ),
            const SizedBox(height: 20),

            /// Tasks Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 10,
              color: const Color.fromARGB(255, 255, 255, 255),

              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Your Tasks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 12),
                    TaskItem( // we use taskitem widget here to create a list of tasks
                      icon: Icons.check_circle,
                      color: Color.fromARGB(255, 1, 49, 2),
                      text: "Meeting with team at 10 AM",
                    ),
                    TaskItem(
                      icon: Icons.timelapse,
                      color: Color.fromARGB(255, 53, 32, 1),
                      text: "Submit report by 3 PM",
                    ),
                    TaskItem(
                      icon: Icons.cancel,
                      color: Color.fromARGB(255, 43, 4, 1),
                      text: "Call with client at 5 PM",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16), // to add some space

            /// Progress Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 10,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                title: const Text(
                  "Progress",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                subtitle: const Text("You're almost there!"),
                trailing: const CircularProgressIndicator(
                  value: 0.2,
                  color: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: Color.fromARGB(255, 228, 18, 18),
                
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                       elevation: 10,
                       
                       
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("View More Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget { // that is responsible component for creating a list of tasks
  final IconData icon;
  final Color color;
  final String text;

  const TaskItem({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}


  