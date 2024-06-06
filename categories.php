<h1>Категории Блюд:</h1>
<?php
$result = $conn->query("SELECT categories.id AS id, categories.name AS cname, category.picture_url, count(dishes.id) as C FROM category LEFT OUTER JOIN dishes ON dishes.id_categories=categories.id_categories WHERE categories.id_user=".$_SESSION['id']." GROUP BY categories.id_categories");

while ($row = $result->fetch()) {
//style="max-width: 18rem;"
    echo'
        
        <div class="card border-dark mb-3" >
            <div class="card-header">Количество блюд: ' . $row['C'] . '</div>
            <div class="card-body text-dark">
                <div class="row g-0">
                    <div class="col-md-1">  
                        <img src="'.$row['picture_url'].'" alt="Task picture" height="60px">
                    </div>
                    <div class="col-md-7">
                    <a class="nav-link" href="/index.php?page=t" >
                        <h5 class="card-title">' . $row['cname'] . '</h5>
                    </a>
                    </div>
                    <div class="col-md-1">
                        <a href="deletecategory.php?id='.$row['id'].'" class="btn btn-danger">Удалить</a>
                    </div>
                </div>
            </div>
            
        </div>
 
    ';
//    echo '<tr>';
//    echo '<td>' .  $row['id']. '</td><td>' . $row['name'] . '</td>';
//    echo '<td><a href=deletecategory.php?id='.$row['id'].'>Удалить</a></td>';
//    echo '</tr>';
}
?>



<h2>Создание категории</h2>
<form method="post" action="insertcategory.php" enctype="multipart/form-data">
    <p><label>
            Имя категории: <input type="text" name="name">
        </label>
    <p><label>
            Описание категории: <input type="text" name="description">
        </label>
    <p><label>
            Изображение: <input type="file" name="filename">
        </label>
    <p><input type="submit" value="Создать">
</form>




