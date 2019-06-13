import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 250.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _createSlider(),
            // _createCheckbox(),
            _createSwitch(),
            _createImage(),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      // activeColor: ,
      label: 'Image Size',
      // divisions: 10,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)
          ? null
          : (value) {
              setState(() => _sliderValue = value);
            },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
        'https://bit.ly/2WAwVwp',
      ),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  // Widget _createCheckbox() {
  //   // return Checkbox(
  //   //   value: _blockCheck,
  //   //   onChanged: (value) {
  //   //     setState(() => _blockCheck = value);
  //   //   },
  //   // );

  //   return CheckboxListTile(
  //     title: Text('Block slider'),
  //     value: _blockCheck,
  //     onChanged: (value) {
  //       setState(() => _blockCheck = value);
  //     },
  //   );
  // }

  _createSwitch() {
    return SwitchListTile(
      title: Text('Block slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() => _blockCheck = value);
      },
    );
  }
}
