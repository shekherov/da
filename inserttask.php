<?php
require "dbconnect.php";
if (strlen($_POST['name']) >= 3){
        try {
            $sql = 'INSERT INTO dishes(name,Cooking_Method,Cooking_Time_in_min,id_categories,id_user, image) VALUES(:name,:Cooking_Method,:Cooking_Time_in_min,:id_categories,:id_user, :image)';
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':name', $_POST['name']);
            $stmt->bindValue(':Cooking_Method', $_POST['Cooking_Method']);
            $stmt->bindValue(':Cooking_Time_in_min', $_POST['Cooking_Time_in_min']);
            $stmt->bindValue(':id_categories', $_POST['id_categories']);
            $stmt->bindValue(':id_user', $_POST['id_user']);
            $stmt->bindValue(':image', $_POST['image']);
            $stmt->execute();
            $_SESSION['msg'] = "Блюдо успешно добавлено";
            // return generated id
            // $id = $pdo->lastInsertId('id');

        } catch (PDOexception $error) {
            $_SESSION['msg'] = "Ошибка добавления блюда: " . $error->getMessage();
        }

}
else $_SESSION['msg'] = "Ошибка добавления блюда: имя задачи должно содержать не менее 3х символов";

// перенаправление на главную страницу приложения
header('Location: http://klek/index.php?page=t#');
exit( );

