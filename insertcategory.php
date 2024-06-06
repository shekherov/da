<?php
require "dbconnect.php";
if (strlen($_POST['name']) >= 3){
    //получение загруженного файла
    if ($file = fopen($_FILES['filename']['tmp_name'], 'r+')){
        //получение расширения
        $ext = explode('.', $_FILES["filename"]["name"]);
        $ext = $ext[count($ext) - 1];
        $filename = 'file' . rand(100000, 999999) . '.' . $ext;

        $resource = Container::getFileUploader()->store($file, $filename);
        $picture_url = $resource['ObjectURL'];
    }
    else
    {
        $picture_url = '/assets/calendar.png';
    }
    try {
        $sql = 'INSERT INTO categories(name, id_categories, picture_url) VALUES(:name,:Cooking_Method,:picture_url,:id_categories)';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':name', $_POST['name']);
        $stmt->bindValue(':id_categories', $_POST['id_categories']);
        $stmt->bindValue(':picture_url', $picture_url);
        $stmt->execute();
        $_SESSION['msg'] = "Категория успешно добавлена";
        // return generated id
        // $id = $pdo->lastInsertId('id');

    } catch (PDOexception $error) {
        $_SESSION['msg'] = "Ошибка добавления категории: " . $error->getMessage();
    }
}
else $_SESSION['msg'] = "Ошибка добавления категории: имя категории должно содержать не менее 3х символов";

// перенаправление на страницу категорий
header('Location: http://klek/index.php?page=t#');
exit( );
