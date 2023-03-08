<?php
session_start();

$servername = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "temp";

$conn = mysqli_connect($servername, $db_user, $db_pass, $db_name);

if(!$conn){
    die("Conexão falhada: " . mysqli_connect_error());
}

mysqli_select_db($conn, "temp");


$nif = $_POST['nif'];
$pin = $_POST['pin'];

if(empty($nif) || empty($pin)){
    $_SESSION['error2'] = "1";
} else{
    unset($_SESSION['error2']);

    $sql = "SELECT username FROM userslogin WHERE nif = '$nif' AND pin = '$pin'";
    $result = mysqli_query($conn, $sql);
    $row = $result->fetch_assoc();

    if(mysqli_num_rows($result) > 0){

            unset($_SESSION['error']);

            $_SESSION['user'] = $row["username"];

            header("Location: ../status.php");
    } else{
        $_SESSION['error'] = "1";

        header("Location: ../login.php");
    }
}
mysqli_close($conn);
?>
    
      

