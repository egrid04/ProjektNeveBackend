function Login() {
    let loginName = document.getElementById("LoginName").value;
    let password = document.getElementById("Password").value;
    console.log(loginName+" "+password)
    let saltUrl = "http://localhost:5000/api/Login/GetSalt/" + loginName;
    axios.post(saltUrl).then((response) => {
        let salt = response.data;
        console.log(salt);
        let tmpHash = sha256(password + salt.toString());
        let loginUrl = "http://localhost:5000/api/Login"
        let body = {
            "loginName": loginName,
            "tmpHash": tmpHash
        }
        console.log(body);
        axios.post(loginUrl,body).then((response) =>{
            if (response.status==200)
                {
                    let user=response.data;
                    console.log(user)
                    sessionStorage.setItem("token",user.token);
                    alert("Sikeres bejelntkezés!")
                    document.getElementById("avatar").src="http://images.balazska.nhely.hu/"+user.profilePicturePath;
                }
            else{
                alert("Hiba történt a bejelentkezéskor!")
            }
        })
        .catch((error) => {
            alert(error);
        });
    })
    .catch((error) => {
        alert (error);
    });
}