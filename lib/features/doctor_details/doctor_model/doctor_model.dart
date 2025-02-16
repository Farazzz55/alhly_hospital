class DoctorModel {
  final String name;
  final String waitingTime;
  final String fees;
  final String specialist;
  final String yearsOfExperience;
  final String numberOfPatients;
  final String hospitalLogo;
  final String hospitalAddress;
  final String hospitalName;
  final String doctorImg;
  final List<String> availableTimes;


  DoctorModel({
     this.name='unKnown',
     this.waitingTime='unKnown',
     this.fees='unKnown',
     this.specialist='unKnown',
     this.yearsOfExperience='unKnown',
     this.numberOfPatients='unKnown',
     this.hospitalName='unKnown',
     this.hospitalLogo='unKnown',
     this.hospitalAddress='unKnown',
     this.doctorImg='assets/images/Doctor.png',
    this.availableTimes = const ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"],
});
}
