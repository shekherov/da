<div class="container">





<h1>Блюда:</h1>
    <div class="list-group">




    <?php

    $result = $conn->query("SELECT *, dishes.id_dishes AS id_dishes, categories.name AS cname, dishes.name AS dname FROM dishes, categories WHERE dishes.id_categories=categories.id_categories");
    while ($row = $result->fetch()) {

    echo '

            <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
            <img src="'.$row['picture_url'].'" alt="twbs" width="32" height="32" class=flex-shrink-0">
            <div class="d-flex gap-2 w-100 justify-content-between">
                <div>
                    <h6 class="mb-0">'.$row['dname'].'</h6>
                </div>
            </div>
        </a>
';


    }
    ?>
</div class="list-group">
</div>