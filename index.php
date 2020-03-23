<?php
require_once('functions.php');


$page_content = include_template('index.php', [
    'Categories_list' => $Categories_list,
    'Announcement_list' => $Announcement_list]);

$layout_content=include_template('layout.php', [
    'p_title' => 'Главная страница',
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'page_content' => $page_content,
    'Categories_list' => $Categories_list]);
print($layout_content);

?>
