function validatePassword() {
    let password = document.getElementById("floatingPassword").value;
    let confirmPassword = document.getElementById("floatingConfirmPassword").value;


    if(password.length !== 0){

         if(password !== confirmPassword){
            alert("Password doesn't match!")
         }
    }
    else{
        alert("Password can't be empty!");
    }
}

function validPlace(){

    let city = document.getElementById("city").value;
    let state = document.getElementById("state").value;

    if(city === "-- Select City --" || state === "-- Select State --"){

        alert("Please fill all the fields!");
    }
}