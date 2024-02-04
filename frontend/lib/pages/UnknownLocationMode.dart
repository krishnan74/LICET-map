
import 'package:flutter/material.dart';
import '../Utils/fetch_location.dart';
import '../Utils/LinePainter.dart';
import '../Utils/fetch_data.dart';
import '../Widgets/DropDownButton.dart';
import 'package:google_fonts/google_fonts.dart';

class UnknownLocation_Page extends StatefulWidget {
  const UnknownLocation_Page({Key? key});

  @override
  State<UnknownLocation_Page> createState() => _UnknownLocationPageState();
}

class _UnknownLocationPageState extends State<UnknownLocation_Page> with TickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController startBlockController = TextEditingController();
  TextEditingController endBlockController = TextEditingController();
  TextEditingController endHallController = TextEditingController();
  List<Map<String, dynamic>>? blocks = [];
  Set<String> shortestPathSet = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    // Load the current location asynchronously and set the controller value
    loadCurrentLocation();
  }

  Future<void> loadCurrentLocation() async {
    final location = await getLocation();
    setState(() {
      startBlockController.text = location;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    startBlockController.dispose();
    endBlockController.dispose();
    super.dispose();
  }

  void updateShortestPath(Set<String> path) {
    setState(() {
      shortestPathSet = path;
    });
  }

  Future<void> calculatePath(String startBlock, String endBlock) async {
    try {
      final calculatedShortestPath = await calculateShortestPath(startBlock, endBlock);
      print('Shortest path: $calculatedShortestPath');
      setState(() {
        shortestPathSet = Set.from(calculatedShortestPath);
      });
    } catch (err) {
      print(err);
      // Handle error appropriately, e.g., show a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $err'),
        ),
      );
    }
  }

  void setEndBlock(String value) {
    setState(() {
      endBlockController.text = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245,245,245,1),
        title: Text("Licet Map"),
      ),
      backgroundColor: Color.fromRGBO(245,245,245, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            SizedBox(height:10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You are currently in Block A',

                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Color.fromRGBO(2,2,2, 1), fontWeight: FontWeight.w800, fontSize: 50, letterSpacing: .01, height: 1),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Please enter where do you want to go',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(color: Color.fromRGBO(25,25,25,1), fontWeight: FontWeight.w600, fontSize: 17, ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                    constraints: BoxConstraints(maxWidth: double.infinity),
                    child:Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Expanded(
                              child: Container(
                                color: Color.fromRGBO(61, 61, 64, 1),
                                child: DropdownButtonExample(
                                  onValueChanged: setEndBlock,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
                                  ),
                                  controller: endHallController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Hall No.',
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                          ],
                        ),
                        const SizedBox(height: 10),
                        shortestPathSet.isNotEmpty
                            ? Text('Shortest Path: ${shortestPathSet.join(" -> ")}')
                            : const SizedBox.shrink(),
                      ],
                    )

                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(61, 61, 64, 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await calculatePath(
                        startBlockController.text,
                        endBlockController.text,
                      );
                      print(shortestPathSet);
                      _controller.forward();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(61, 61, 64, 1),
                      ),
                    ),
                    child: Text(
                      "Get Route",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Container(

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/LICET.png", width: 400, height: 300, fit: BoxFit.cover, alignment: Alignment.center,)),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 100.0),
                            painter: LinePainter(_controller.value, shortestPathSet),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }

}
