<?php

$host = '127.0.0.1';
$dbName = 'pagination';
$port = 3306;
$username = 'root';

$pdo = new \PDO("mysql:host={$host};dbname={$dbName};port={$port}", $username);

$currentPage = 1;

if (!empty($_GET['page'])) {
    $currentPage = $_GET['page'];
}

$nbProduct = $pdo->query('SELECT COUNT(*) FROM products')->fetch(PDO::FETCH_COLUMN);
$productPerPage = 10;

$pages = ceil($nbProduct / $productPerPage);

$statement = $pdo->prepare('SELECT * FROM products LIMIT :productPerPage OFFSET :offset');
$statement->bindValue(':productPerPage', $productPerPage, PDO::PARAM_INT);
$statement->bindValue(':offset', $productPerPage * ($currentPage - 1), PDO::PARAM_INT);
$statement->execute();

$products = $statement->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <h1>Liste des jeux</h1>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prix</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
                        <th scope="row"><?= htmlspecialchars($product['id']) ?></th>
                        <td><?= htmlspecialchars($product['name']) ?></td>
                        <td><?= htmlspecialchars($product['price']) ?> €</td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <ul class="pagination justify-content-center">

        <li class="page-item">
            <?php if ($currentPage > 1): ?>
                <a class="page-link" href="index.php?page=<?= $currentPage - 1 ?>" tabindex="-1">Précedent</a>
            <?php else: ?>
                <a class="page-link disabled" href="#" tabindex="-1">Précedent</a>
            <?php endif; ?>
        </li>

        <?php for ($i = max(1, min($currentPage - 2, $pages - 4)); $i <= min(max($currentPage + 2, 5), $pages); $i++): ?>
            <li class="page-item <?php if ($currentPage == $i) {
                echo 'active';
            } ?>">
                <a class="page-link" href="index.php?page=<?= $i ?>" <?= $i == $currentPage ? 'class="active"' : '' ?>><?= $i ?></a>
            </li>
        <?php endfor ?>

        <li class="page-item">
            <?php if ($currentPage < $pages): ?>
                <a class="page-link" href="index.php?page=<?= $currentPage + 1 ?>">Suivant</a>
            <?php else: ?>
                <a class="page-link disabled" href="#" tabindex="-1">Suivant</a>
            <?php endif; ?>
        </li>
    </ul>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>