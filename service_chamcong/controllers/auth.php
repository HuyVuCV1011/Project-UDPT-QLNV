<?php

use ServiceChamCong\Core\Controller;
/**
 * Class Auth
 */
class Auth extends Controller
{
    /**
     * @inheritDoc
     */
    public function execute()
    {
        $this->view('login', []);
    }
}