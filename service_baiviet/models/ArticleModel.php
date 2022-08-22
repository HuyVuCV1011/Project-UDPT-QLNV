<?php
require 'vendor/autoload.php';

/**
 * Class ArticleModel
 */
class ArticleModel
{

    public function getArticles()
    {
        $socialArr = [];
        $recruitArr = [];
        $m = new MongoDB\Client("mongodb+srv://m220student:m220password@cluster0.iumak.mongodb.net/test");
        $db = $m->QLNhanVien;
        $socialCollection = $db->HoatDongXaHoi;
        $socials = $socialCollection->find();
        foreach ($socials->toArray() as $social) {
            $socialArr[] = 
            [
                'date' => $social['NgayDang']->toDateTime()->format('d/m/Y H:i:s'),
                'title' => $social['TieuDe'],
                'content' => $social['NoiDung']
            ];
        }
        $recruitCollection = $db->TuyenDung;
        $recruits = $recruitCollection->find();
        foreach ($recruits->toArray() as $recruit) {
            $recruitArr[] = 
            [
                'position' => $recruit['TenViTri'],
                'date' => $recruit['NgayDang']->toDateTime()->format('d/m/Y H:i:s'),
                'introduce' => $recruit['GioiThieuCV'],
                'skill' => $recruit['YeuCauKyNang'],
                'salary' => $recruit['MucLuong'],
                'benifit' => $recruit['DaiNgo']
            ];
        }

        return ['socials' => $socialArr, 'recruits' => $recruitArr];
    }
}