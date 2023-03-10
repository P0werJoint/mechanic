<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="css/public.css">
</head>
<body>
    <link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">

    <ul class="ul">
            <li class="li"><a class="lia">Mechanic</a></li>
            <li class="li"><a class="activem lia" href="status.php">Check your car Status!</a></li>
            <li class="li"><a class="lia" href="us.html">Find Us</a></li>
            <li class="li" style="float:right"><a class="lia" href="help.html">FAQ</a></li>
    </ul>

    <div class="main">

        <h1 class="centertxt">Login</h1>
        <div class="container-login">

<?php
            session_start();

            if( isset($_SESSION['error'])){
                echo '
                <div class="error center">
                <h6>Credenciais incorretas!</h1>
                </div>
                ';
            }
            if( isset($_SESSION['error2'])){
                echo '
                <div class="error center">
                <h6>Preencha os dois campos!</h1>
                </div>
                ';
            }
?> 

            <form action="php/phplogin.php" method="post">
            <label class="label-login center">NIF </label>
            <input class="input" type="text" name="nif" id="nif" required>
            <label class="label-login center">PIN </label>
            <input class="input" type="password" name="pin" id="pin" required>
            <button class="center btn btn-primary" type="submit">Login to check your car status!</button>
            </form>
        </div>
    </div>

    <div class="footer">
        <p>@Mechanic • 2023 • mechanic@mec.com</p>
    </div>
</body>
</html>
