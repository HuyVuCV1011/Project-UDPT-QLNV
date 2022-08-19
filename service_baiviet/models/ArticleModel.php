<?php
require 'vendor/autoload.php';

/**
 * Class ArticleModel
 */
class ArticleModel
{

    public function getArticles()
    {
        $m = new MongoDB\Client("mongodb+srv://m220student:m220password@cluster0.iumak.mongodb.net/test");
        $db = $m->QLNhanVien;
        $socialCollection = $db->HoatDongXaHoi;
        $socials = $socialCollection->find();
        $recruitCollection = $db->TuyenDung;
        $recruits = $recruitCollection->find();

        return ['socials' => $socials, 'recruits' => $recruits];
    }
}