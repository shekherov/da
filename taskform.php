
    <h2>Создание блюда</h2>
    <form method="post" action="inserttask.php" enctype="multipart/form-data">

        <p><label>
                Имя блюда: <input type="text" name="name">
            </label>
        <p><label>
                Описание блюда: <input type="text" name="description">
            </label>
        <p><label>
                Категория: <select name="id_category">
                    <?
                    $result = $conn->query("SELECT * FROM categories");
                    while ($row = $result->fetch()) {
                        echo '<option value='.$row['id'].'>'.$row['name'].'</option>';

                    }
                    ?>
                </select>
            </label>

        <p><input type="submit" value="Создать">

    </form>
