<?php

require "dbconnect.php";


    try {
        $sql = 'DELETE FROM dishes WHERE id_dishes=:id';
        $stmt = $conn->prepare($sql);
        $stmt->bindValue(':id', $_GET['id']);
        $stmt->execute();
        $_SESSION['msg'] = "Блюдо успешно удалено";
        // return generated id
        // $id = $pdo->lastInsertId('id');
    } catch (PDOexception $error) {
        $_SESSION['msg'] = "Ошибка удаления блюда: " . $error->getMessage();
    }
    // перенаправление на главную страницу приложения
    header('Location: http://klek/index.php?page=t#');
    exit( );


