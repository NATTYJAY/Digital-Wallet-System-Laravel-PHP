<?php

    function validateEmail($data)
    {
        return filter_var($data, FILTER_VALIDATE_EMAIL)? true: false;
    }