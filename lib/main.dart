import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart' as google_place;
import 'package:google_maps_webservice/places.dart' as google_maps_webservice;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps Demo',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  List<PlaceDetails> _selectedPlaces = [];

  google_place.GooglePlace googlePlace =
      google_place.GooglePlace("YOUR_API_KEY_HERE");

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchPlaces() async {
    final p = await PlacesAutocomplete.show(
      context: context,
      logo: Text(" "),
      mode: Mode.overlay,
      apiKey: "YOUR_API_KEY_HERE",
      onError: (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.errorMessage ?? 'Unknown error'),
          ),
        );
      },
    );

    if (p != null) {
      final places = google_maps_webservice.GoogleMapsPlaces(
          apiKey: "YOUR_API_KEY_HERE");
      final details = await places.getDetailsByPlaceId(p.placeId!);
      final lat = details.result.geometry!.location.lat;
      final lng = details.result.geometry!.location.lng;
      final name = details.result.name;
      final address = details.result.formattedAddress;

      final placeDetails = PlaceDetails(
        name: name,
        address: address!,
        location: LatLng(lat, lng),
      );

      setState(() {
        _selectedPlaces.add(placeDetails);
      });

      // Print all selected place details
      for (PlaceDetails place in _selectedPlaces) {
        print('Name: ${place.name}');
        print('Address: ${place.address}');
        print(
            'Location: ${place.location.latitude}, ${place.location.longitude}');
      }

      // Move camera to the latest selected location
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(lat, lng),
          14.0, // You can adjust the zoom level as needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.7749, -122.4194),
                    zoom: 10,
                  ),
                  markers: _selectedPlaces.map((place) {
                    return Marker(
                      markerId: MarkerId(place.location.toString()),
                      position: place.location,
                      infoWindow: InfoWindow(
                        title: place.name,
                        snippet: place.address,
                      ),
                    );
                  }).toSet(),
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            right: 110,
            child: InkWell(
              onTap: () {
                _searchPlaces();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 5),
                      child: Text(
                        'Search Here',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceDetails {
  final String name;
  final String address;
  final LatLng location;

  PlaceDetails({
    required this.name,
    required this.address,
    required this.location,
  });
}
