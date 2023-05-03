import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'models/Events.dart';
import 'package:intl/intl.dart';




class AddDataWidget extends StatefulWidget {
  const AddDataWidget({Key? key}) : super(key: key);

  @override
  State<AddDataWidget> createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _dateController = TextEditingController();
  final _dureeController = TextEditingController();
   final _nbplace = TextEditingController();
   bool _isChecked = false;
 File? _imageFile;
  bool _isLoading = false;
  Future<void> _addEvent()async{
     if (_addFormKey.currentState!.validate()) {
      _addFormKey.currentState!.save();
      await api.createEvent(Events(name: _nameController.text,description: _descriptionController.text,  location: _locationController.text, imageUrl: _imageUrlController.text, date: _dateController.text, duree: _dureeController.text,nbplace:int.parse( _nbplace.text), updated: DateTime.now().toString()));
       Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
        ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        'Event add succefully',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );

     }                               
    
  }

 Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }
   bool isCompleted = false;
   List<Step>stepList()=>[
    Step(
      
      state: _activeStepIndex > 0 ? StepState.complete : StepState.disabled,
      isActive: _activeStepIndex >=0,
      title: Text('General informations'), 
    content: Column(
      children: <Widget>[
        Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Event Name',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _nameController,
  decoration: InputDecoration(
    hintText: 'Event Name',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
      
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the event name !';
    }
    return null;
  },
),
  ],
),
 SizedBox(height: 18),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Description',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
     // définir la hauteur souhaitée du TextFormField
     TextFormField(
        controller: _descriptionController,
        decoration: InputDecoration(
        
          contentPadding: EdgeInsets.symmetric(vertical: 55.0), // définir la marge interne de la zone de saisie
           hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
        ),
        maxLines: null, // permet à l'utilisateur d'écrire autant de lignes qu'il souhaite
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the event description';
          }
          return null;
        },
      ),
   
  ],
),
 SizedBox(height: 18),
    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Location',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _locationController,
  decoration: InputDecoration(
    hintText: 'location',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter location !';
    }
    return null;
  },
),
  ],
),
 SizedBox(height: 18),
    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Date',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
  controller: _dateController,
  decoration: InputDecoration(
    icon:Icon(Icons.calendar_today),
    hintText: 'Enter Date',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  readOnly: true,
  onTap: ()async{
DateTime? pickedDate = await showDatePicker(context: context,
initialDate: DateTime.now(),
firstDate: DateTime(2000),
lastDate: DateTime(2101),
);
if(pickedDate!=null){
  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
  setState(() {
    _dateController.text =formattedDate.toString();
  });
}else{
  print("not selected");
}
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter date !';
    }
    return null;
  },
),
  ],
),
      ],
    ),
    ),
     Step(
      state: _activeStepIndex > 1 ? StepState.complete : StepState.disabled,
      isActive: _activeStepIndex >=1,
      title: Text('Details'),
     content: Column(
      children:<Widget> [
 GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (_) => BottomSheet(
                      onClosing: () {},
                      builder: (_) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('Take photo'),
                            leading: Icon(Icons.camera_alt),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: Text('choose from gallery'),
                            leading: Icon(Icons.photo_library),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Add Event image',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    ),
    SizedBox(height: 10),
    Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 400,
      child: _imageFile == null
          ? Icon(Icons.camera_alt_outlined, size: 60, color: Colors.grey)
          : Image.file(_imageFile!, fit: BoxFit.cover),
    ),
  ],
),
              ),
              SizedBox(height: 15),
               Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Number of places',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
   keyboardType: TextInputType.number,
   
  controller: _nbplace,
  decoration: InputDecoration(
    hintText: 'Enter number of places',
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number of places !';
    }
    return null;
  },
),
  ],
),
    SizedBox(height: 15),
 Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Duration',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 18,
      ),
    ),
    SizedBox(height: 10,),
 TextFormField(
 
  controller: _dureeController,
  decoration: InputDecoration(
    hintText: "Enter the event's duration",
    hintStyle: TextStyle(
      color: Colors.grey[500],
      fontSize: 14,
    ),
    filled: true, // ajouter un fond rempli de couleur
    fillColor: Colors.grey[200], // définir la couleur de l'arrière-plan
    border: OutlineInputBorder( // définir une bordure de rectangle
      borderRadius: BorderRadius.circular(8.0), // personnaliser le rayon des coins du rectangle
      borderSide: BorderSide.none, // supprimer la bordure de ligne
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter duration';
    }
    return null;
  },
),
  ],
),
SizedBox(height: 15),
Column(
    children: [
      CheckboxListTile(
        tristate: true,
        title: Text('Available via Conf'),
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
          });
        },
      ),
    ],
),
      ],
     )
     ),
   ];
     int _activeStepIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:orangeColor,
        title: const Text('Add Event'),
      ),
      body:Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: orangeColor),
        ),
        child: Form(
        key: _addFormKey,
        child: Stepper(
           type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
      onStepContinue: () {
        final isLastStep = _activeStepIndex == stepList().length -1;
        _addFormKey.currentState!.validate();
        bool isDetailValid = isDetailComplete();
        if(isDetailValid){
   if(isLastStep){
    _addEvent();
          
        setState(() {
            
            isCompleted = true;
          });
         
  // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
        }else{
          setState(() {
            _activeStepIndex += 1;
          });
        }
        }
     
          
        },
        onStepTapped: (step){
          _addFormKey.currentState!.validate();
          setState(() {
            _activeStepIndex = step;
          });
        },
      onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          setState(() {
            _activeStepIndex -= 1;
          });
        
        },
controlsBuilder: (context, details,{onStepContinue, onStepCancel}) {
  final isLastStep = _activeStepIndex == stepList().length -1;
  return Container(
    margin: EdgeInsets.only(top: 50),
    child: Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
    backgroundColor:Color.fromARGB(255, 4, 41, 72),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
            ),
                   onPressed:_isLoading ? null :details.onStepContinue,
            child:
            _isLoading
? CircularProgressIndicator(
valueColor: AlwaysStoppedAnimation(Colors.grey),
): Text(isLastStep ? 'Confirm':'Following'),
            ),
          ),
          const SizedBox(width: 12),
          if(_activeStepIndex !=0)
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 102, 102, 102),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
              child:Text('Cancel') ,
              onPressed: details.onStepCancel,
              ),
            ),
      ],
    ),
  );
},
        ),
        ),
      ),
    );
  }

   bool isDetailComplete(){
    if(_activeStepIndex ==0){
      if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _locationController.text.isEmpty || _dateController.text.isEmpty){
        return false;
      }else{
        return true;
      }
    }else if (_activeStepIndex ==1){
      if(_nbplace.text.isEmpty || _dureeController.text.isEmpty){
        return false;
      }else{
        return true;
      }
    }
    return false;
  }
}
  
     
        
        
        
        
       
                                
                              