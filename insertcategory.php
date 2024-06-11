<?php
    require "dbconnect.php";
    if (strlen($_POST['name']) >= 3){
        //получение загруженного файла
        if ($file = fopen($_FILES['filename']['tmp_name'])){
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
            $sql = 'INSERT INTO categories(name, id_user) VALUES(:name,:id_user)';
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':name', $_POST['name']);
            $stmt->bindValue(':id_user', $_POST['id_user']);
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

