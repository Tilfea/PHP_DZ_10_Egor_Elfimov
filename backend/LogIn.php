<link rel="stylesheet" href="../frontend/css/style.css">
<?php
require_once '../frontend/header.html';
require_once './connection.php';
require_once './function.php';

if (!empty($_COOKIE['LogIn'])){
    ?><p class='up'>Добро пожаловать!</p>
        
        <form class='up' method='post'>
        <div class="mb-3">
            <input type="hidden" name="logOut" value="logOut" />
            <button type="submit" class="btn btn-primary">Выйти</button>
        </div>
    </form>

    <?php
} else {
?>
<!-- Registrate -->
<div class='cat1'>
    <div>Регистрация</div>
<form method="post">
    <div class="mb-3">
    <label for="username" class="form-label">Username</label>
    <input type="text" class="form-control" id="username" name="Rusername" pattern="[A-Za-zА-Яа-яЁё]{2,15}" required>
    </div>
    <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="Rpassword" pattern="[A-Za-zА-Яа-яЁё0-9]{5,20}" required>
    </div>
    <button type="submit" class="btn btn-primary">Регистрация</button>
</form>
</div>

<!-- LogIn -->
<div class='cat1'>
<div>Вход</div>
<link rel="stylesheet" href="../frontend/css/style.css">
<form method="post">
    <div class="mb-3">
    <label for="username" class="form-label">Username</label>
    <input type="text" class="form-control" id="username" name="username" required>
    </div>
    <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary">Вход</button>
</form>
</div>

<?php
};
// LogOut
if (!empty($_POST['logOut'])){
    setcookie('LogIn', 'Welcome_in_system', time()-10);
    header('Location: ?');
};

if (!empty($_POST['username'])){
    $result1 = $mysqli->query('SELECT * FROM users');

    if($result1->num_rows){
        while($row = mysqli_fetch_assoc($result1)){
        if (($row['username'] == $_POST['username']) && ($row['password'] == sha1($_POST['password'] . 'Tilfea'))){
            setcookie('LogIn', 'Welcome_in_system');
        break;
        } else {?><p>Пользователь, <?php echo $_POST['username'];?>, не найден</p>
        <?php
        };
        };
        header('Location: ?');
    };
};


if (!empty($_POST['Rusername'] && $_POST['Rpassword'])){
    $result = $mysqli->query('SELECT * FROM users');
        $data['id'] = $mysqli->insert_id;
        $data['username'] = $_POST['Rusername'];
        $data['password'] = sha1($_POST['Rpassword'] . 'Tilfea');
        $response = array_filter($data, function($el){
            if (empty($el)){
                return false;
            }
            return true;
        });
        insertToDb1($mysqli, $data);
    };
    function insertToDb1($mysqli, array $data)
    {
        $keys = implode(',', array_keys($data));  // формируем столбцы для запроса
        $vals = "'" . implode('\',\'', array_values($data)) . "'";  // формируем данные для запроса
        // die(var_dump($data));
        $query = "INSERT INTO users ($keys) VALUES ($vals)";   // формируем запрос к базе
        // die(var_dump($query));
        $mysqli ->query($query);  // отправляем через метод данные в базу

        header('Location: ?');
    };
    echo $query;


require_once '../frontend/footer.html';