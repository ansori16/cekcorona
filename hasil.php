<?php 
include 'function.php';


if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
        exit();
    } else if ($_SESSION['role'] == 2) {
        header("location: indexPakar.php");
        exit();
    }
} else {
    header("location:index.php");
    exit();
}

if (!isset($_POST['gejala'])) {
    echo "No symptoms selected!";
    exit();
}

$selected_gejala = $_POST['gejala'];

$selected_gejala = $_POST['gejala'];

// Asumsi daftar gejala
$gejala_list = [
    1 => 'Gejala 1 = Demam atau merasa panas/ menggigil',
    2 => 'Gejala 2 = Batuk Berdahak',
    3 => 'Gejala 3 = Sakit tenggorokan ',
    4 => 'Gejala 4 = Pilek',
    5 => 'Gejala 5 = Nyeri dada otot atau tubuh ',
    6 => 'Gejala 6 = Sakit Kepala',
    7 => 'Gejala 7 = Kelelahan (mailase)',
    8 => 'Gejala 8 = Batuk kering',
    9 => 'Gejala 9 = Kehilangan rasa atau bau (ansomnia)',
    10 => 'Gejala 10 = Hidung Tersumbat',
    11 => 'Gejala 11 = Sesak Nafas',
    
];

$Covid_19 = array(1, 2, 3,4, 5, 6, 9);
$Covid_19_Varian_Alpha = array(5, 9);
$Covid_19_Varian_Beta = array(1, 5, 9);
$Covid_19_Varian_Gamma = array(2, 3, 4, 6, 11);
$Covid_19_Varian_Delta = array(2, 3, 4, 6, 7, 9, 11);
$Covid_19_Varian_Omicron = array(1, 3, 4, 6, 7, 8, 9, 10);


function calculatePercentage($symptoms, $selected_gejala) {
    $nilai = 0;
    foreach ($selected_gejala as $value) {
        if (in_array($value, $symptoms)) {
            $nilai += 1;
        }
    }
    return number_format(($nilai / count($symptoms)) * 100, 2);
}

$Covid_19_percentage = calculatePercentage($Covid_19, $selected_gejala);
$Covid_19_Varian_Alpha_percentage = calculatePercentage($Covid_19_Varian_Alpha, $selected_gejala);
$Covid_19_Varian_Beta_percentage = calculatePercentage($Covid_19_Varian_Beta, $selected_gejala);
$Covid_19_Varian_Gamma_percentage = calculatePercentage($Covid_19_Varian_Gamma, $selected_gejala);
$Covid_19_Varian_Delta_percentage = calculatePercentage($Covid_19_Varian_Delta, $selected_gejala);
$Covid_19_Varian_Omicron_percentage = calculatePercentage($Covid_19_Varian_Omicron, $selected_gejala);


$solusi_map = [
    'Covid-19' => $Covid_19_percentage,
    'Covid-19 Varian Alpha' => $Covid_19_Varian_Alpha_percentage,
    'Covid-19 Varian Beta' => $Covid_19_Varian_Beta_percentage,
    'Covid-19 Varian Gamma' => $Covid_19_Varian_Gamma_percentage,
    'Covid-19 Varian Delta' => $Covid_19_Varian_Delta_percentage,
    'Covid-19 Varian Omicron' => $Covid_19_Varian_Omicron_percentage,

];

arsort($solusi_map);
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
    <title>Hasil Diagnosis</title>
</head>
<body>
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
                        <a class="btn btn-primary ml-2" href="test.php" role="button">Cek Ulang</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ml-2" href="logout.php" role="button">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="gejala mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Gejala yang Dipilih:</h3>
                    <ul>
                        <?php foreach ($selected_gejala as $gejala): ?>
                            <li><?php echo $gejala_list[$gejala]; ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="hasil mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Hasil Diagnosis Anda:</h3>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Penyakit</th>
                                <th scope="col">Persentase</th>
                                <th scope="col">Solusi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($solusi_map as $penyakit => $persentase): ?>
                                <tr>
                                    <td><?php echo $penyakit; ?></td>
                                    <td><?php echo $persentase; ?>%</td>
                                    <td>
                                        <?php
                                        // Mengambil solusi untuk setiap penyakit dari database
                                        $query = "SELECT solusi FROM solusi WHERE id_penyakit = (SELECT id_penyakit FROM penyakit WHERE penyakit = '$penyakit')";
                                        $result = mysqli_query($koneksi, $query);

                                        if (!$result) {
                                            echo "Error: " . mysqli_error($koneksi);
                                        } else {
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                echo '<div>' . $row['solusi'] . '</div>';
                                            }
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
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
