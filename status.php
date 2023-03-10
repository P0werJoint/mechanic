<?php
session_start();
if( !isset($_SESSION['user']) ){
    header("location:/login.php");
    echo "<h3 style= 'text-align: center; padding: 20% 0;'>Nothing for you to see here...</h3>";
    die();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mechanic Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="css/public.css">
</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">

    <ul>
            <li><a href="index.html">Mechanic</a></li>
            <li><a class="activem">Check your car Status!</a></li>
            <li><a href="us.html">Find Us</a></li>
            <li style="float:right"><a href="help.html">FAQ</a></li>
    </ul>

    <div class="main">

    <h1 class="centertxt">Timeline</h1>

     <?php
     echo "<h3 class='centertxt white'>Welcome back,  ".$_SESSION['user']."<h3>";
     // Andre faz acaba de fazer o timeline.php para ontem
     ?>
     
    <button class="center btn btn-primary"  onclick="location.href='/php/logout.php'">Logout</button>
    </div>

    <div class="footer">
        <p>@Mechanic • 2023 • mechanic@mec.com</p>
    </div>

</body>
</html>
