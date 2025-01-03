<?php 
include 'function.php';


if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("Location: indexAdmin.php");
        exit();
    } else if ($_SESSION['role'] == 2) {
        header("Location: indexPakar.php");
        exit();
    }
} else {
    header("Location: index.php");
    exit();
}

// Fetch gejala from database
$gejala_result = mysqli_query($koneksi, "SELECT id_gejala, gejala FROM gejala");
$gejala_list = [];
while ($row = mysqli_fetch_assoc($gejala_result)) {
    $gejala_list[] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous"/>
    <link
    href="https://fonts.googleapis.com/css?family=Poppins:300,400,700&display=swap"
    rel="stylesheet"/>
    <link rel="stylesheet" href="custom.css" />
    <style>
      body{
        background-color: #b3cee5;
        
      }
    </style>
    <title>Ayo Cek Corona</title>
</head>
<body>
    <div class="container-login100" style="background-image: url('template/masuk/images/logocorona.png');">
    </div>
    <nav class="navbar py-2 navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="gambar/logocorona.png" width="200" alt="logo" />
            </a>
            <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-primary" href="logout.php" role="button">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="test mt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h2 class="mb-4 text-center">Pilih Gejala yang Anda Alami :</h2>
                    <form action="hasil.php" method="post">
                        <table class="table table-bordered">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Gejala</th>
                                    <th scope="col" class="text-center">Pilih</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($gejala_list as $index => $gejala) {
                                    echo '<tr>
                                            <th scope="row">' . ($index + 1) . '</th>
                                            <td>' . $gejala['gejala'] . '</td>
                                            <td class="text-center"><input type="checkbox" name="gejala[]" value="' . $gejala['id_gejala'] . '"></td>
                                          </tr>';
                                }
                                ?>
                            </tbody>
                        </table>
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
<script
    src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"
></script>
<script
    src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"
></script>
<script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"
></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"
></script>
</html>
