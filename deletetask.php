<?php
require "dbconnect.php";
try {
    echo ("SELECT * FROM dishes");
    $result = $conn->query("SELECT * FROM dishes");
    $row = $result->fetch();
    $result = $conn->query("SELECT * FROM dishes");
    if ($result->rowCount() == 0) throw new PDOException('Блюдо не найдена', 1111 );
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