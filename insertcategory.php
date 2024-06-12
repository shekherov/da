<?php
    require_once "dbconnect.php";
    // print_r($_FILES);
    print_r($_FILES['picture']);
    $path = 'assets/'. time().$_FILES['picture']['name'];
    echo $path;
    if(!move_uploaded_file($_FILES['picture']['tmp_name'], "../".$path)) {
        $_SESSION['message'] = 'Ошибка при загрузке изображения';
    }

        try {
            $sql = 'INSERT INTO categories(name, id_user, image) VALUES(:name,:id_user, :image)';
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':name', $_POST['name']);
            $stmt->bindValue(':id_user', $_POST['id_user']);
            $stmt->bindValue(':image', $_POST['image']);
            $stmt->execute();
            $_SESSION['msg'] = "Категория успешно добавлена";
            // return generated id
            // $id = $pdo->lastInsertId('id');

        } catch (PDOexception $error) {
            $_SESSION['msg'] = "Ошибка добавления категории: " . $error->getMessage();
        }

    // перенаправление на страницу категорий
    header('Location: http://klek/index.php?page=t#');
    exit( );

