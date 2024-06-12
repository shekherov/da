<?php
    require "dbconnect.php";
    try {
        echo ("SELECT * FROM categories");
        $result = $conn->query("SELECT * FROM categories");
        $row = $result->fetch();
        $result = $conn->query("SELECT * FROM categories");
        if ($result->rowCount() == 0) throw new PDOException('Категория не найдена', 1111 );
        $sql = 'DELETE FROM categories WHERE id_categories=:id';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':id', $_GET['id']);
        $stmt->execute();
        $_SESSION['msg'] = "Категория успешно удалена";
        // return generated id
        // $id = $pdo->lastInsertId('id');
    } catch (PDOexception $error) {
        if ($error->getCode() == '23000') {
            $_SESSION['msg'] = "Ошибка удаления категории: данная категория используется в другой таблице и не может быть удалёна";
        } else {
            $_SESSION['msg'] = "Ошибка удаления категории: " . $error->getMessage();
        }
    }
    // перенаправление на главную страницу приложения
    header('Location: http://klek/index.php?page=t#');
    exit( );


