
  var config = {
    apiKey: "AIzaSyBcxfs9enbk_LZ6YN9p9MDbeIbHwQvc388",
    authDomain: "hvt2-1519495006532.firebaseapp.com",
    databaseURL: "https://hvt2-1519495006532.firebaseio.com",
    projectId: "hvt2-1519495006532",
    storageBucket: "hvt2-1519495006532.appspot.com",
    messagingSenderId: "963390655118"
  };
  firebase.initializeApp(config);

var firebaseRef = firebase.database().ref().child("Rishabh");
var fireHeading = document.getElementById("fireHeading");
firebaseRef.on('value', function(datasnapshot){
	fireHeading.innerText = datasnapshot.val();
});