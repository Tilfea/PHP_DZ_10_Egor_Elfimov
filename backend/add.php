<link rel="stylesheet" href="../frontend/css/style.css">
<?php
require_once '../frontend/header.html';
require_once './connection.php';
require_once './function.php';

?>
<div class="all">
<form method="post" class='dw'>
<div class="mb-3">
    <label for="title" class="form-label">Название книги</label>
    <input type="text" class="form-control" name="title" required>
    </div>

    <div class="mb-3">
    <label for="author" class="form-label">Автор книги</label>
<input list="author" class="form-author" name="author" required>
        <datalist id="author">
        <?php
        // формируем список авторов из базы для выбора в форме добавления
        $result2 = $mysqli->query('SELECT * FROM AUTHORS');
        ?>
        <div class="all">
            <?php
        if($result2->num_rows){
            while($row = mysqli_fetch_assoc($result2)){
            ?><option><?php echo "$row[id]";?></option>
        <?php
            } 
        } else {
            ?><option><?php echo "нет авторов";?></option>
            <?php
        };
        ?>
        </datalist> 
    </div>
    </div>
    <div class="mb-3">
    <label for="categories" class="form-label">Категория книги</label>
    <input list="categories" class="form-categories" name="categories" required>
        <datalist id="categories">
        <?php
        // формируем список категорий из базы для выбора в форме добавления
        $result4 = $mysqli->query('SELECT * FROM CATEGORIES');
        ?>
        <div class="all">
            <?php
        if($result4->num_rows){
            while($row = mysqli_fetch_assoc($result4)){
            ?><option><?php echo "$row[id]";?></option>
        <?php
            } 
        } else {
            ?><option><?php echo "нет категории";?></option>
            <?php
        };
        ?>
        </datalist> 
    </div>
    </div>
    
    <div class="mb-3">
    <label for="text" class="form-label">Описание</label>
    <textarea rows="1" cols="26" name="text" required></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Отправить</button>
</form>

</div>


<?php

if (!empty($_POST)) {
    $data['id'] = $mysqli->insert_id;
    // $data['active'] = 1;
    $data['title'] = $_POST['title'];
    $data['code'] = translit_path($_POST['title']);
    $data['content'] = $_POST['text'];
    $data['category_id'] = (int) $_POST['categories'];
    $data['author_id'] = (int) ($_POST['author']);
    $response = array_filter($data, function($el){
        if (empty($el)){
            return false;
        }
        return true;
    });
        insertToDb($mysqli, $data);

}

function insertToDb($mysqli, array $data)
{
    $keys = implode(',', array_keys($data));  // формируем столбцы для запроса
    $vals = "'" . implode('\',\'', array_values($data)) . "'";  // формируем данные для запроса
    // die(var_dump($data));
    $query = "INSERT INTO POSTS ($keys) VALUES ($vals)";   // формируем запрос к базе
    // die(var_dump($query));
    $mysqli ->query($query);  // отправляем через метод данные в базу
    header('Location: /');
}
echo $query;

require_once '../frontend/footer.html';
