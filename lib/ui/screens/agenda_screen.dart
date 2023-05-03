import 'package:flutter/material.dart';
import 'package:transan_app/constant/strings.dart';
import 'package:transan_app/themes/colors.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Agenda extends StatefulWidget {
  const Agenda({ Key? key }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda>{

  DateTime selectedDay = DateTime.now();
  late List <CleanCalendarEvent> selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day):
    [
      CleanCalendarEvent(
        'Movimiento id: 10011', 
        startTime: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day, 10,0),
        endTime: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day, 12,0),
        description: 'llega carga de cantidad 12',
        color: Colors.blue[700]!,
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day+2):
    [
      CleanCalendarEvent(
        'Movimiento id: 10013', 
        startTime: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+2, 14,0),
        endTime: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+2, 17,0),
        description: 'llega carga de cantidad 15',
        color: Colors.orange,
        
      ),
    ]
    
  };

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  Future<void> getData() async {
    //obtener id de la bodega del operario
    int id = 0;
    final url = Uri.parse('http://localhost:8090/api/warehouse/ConsultarMovimientos/${id}/shipping');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      
      // Hacer algo con jsonData
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        automaticallyImplyLeading: false,
        title: Text(
          Strings.showSchedule,
          style: TextStyle( color: Colors.black,),
        ),
      ),
      body: SafeArea(
        child: Container(
              child: Calendar(
                startOnMonday: true,
                selectedColor: Colors.lightBlue,
                todayColor: Colors.red,
                eventColor: Colors.green,
                eventDoneColor: Colors.amber,
                bottomBarColor: Colors.deepOrange,
                onRangeSelected: (range){
                  print('selected Day ${range.from}, ${range.to}');
                },
                onDateSelected: (date){
                  return _handleData(date);
                },
                events: events,
                isExpanded: true,
                dayOfWeekStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.black12,
                  fontWeight: FontWeight.w100,
                ),
                hideBottomBar: false,
                hideArrows: false,
                weekDays: const ['Lun', 'Mar', 'Jue', 'Vie', 'Sab', 'Dom'],
                bottomBarArrowColor: Colors.black,
              ),
        )
      ),
    );
  }
}

