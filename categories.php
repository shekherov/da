<h1>Категории Блюд:</h1>
<?php
$result = $conn->query("SELECT categories.id_categories AS id, categories.name AS cname, count(dishes.id_dishes) as C FROM categories LEFT OUTER JOIN dishes ON categories.id_categories=dishes.id_categories GROUP BY categories.id_categories");

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
            Изображение: <input type="file" name="filename">
        </label>
    <p><label>
            Пользователь: <select name="id_user">

                <?php
                $result = $conn->query("SELECT * FROM user");
                while ($row = $result->fetch()) {
                    echo '<option value='.$row['id_user'].'>'.$row['lastname'].'</option>';

                }
                ?>
            </select>
        </label>
    <p><input type="submit" value="Создать">
</form>




