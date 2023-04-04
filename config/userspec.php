<?php

return [

    /*
    |--------------------------------------------------------------------------
    | User Defined Currency
    |--------------------------------------------------------------------------
    |
    | Here you may specify which of the 3 character Currency label you wish
    | to use. Examples: USD, AUD, GBP, MYR etc. These are currently only
    | for display purposes, although if online processing occurs they
    | may be further use in setting up the payment system
    |
    */

    'currency' => env('DISP_CURRENCY', 'USD'),

    /*
    |--------------------------------------------------------------------------
    | Secret Word to be inserted in Messages for human validation
    |--------------------------------------------------------------------------
    |
    | Here you may specify a specific word , and the placeholder text to be
    | entered on the messages screen to validate it's a human and not a
    | bot
    |
    */

    'my_word' => env('KEY_WORD', 'KEYWORD'),
    'my_phrase' => env('MY_PHRASE', 'Concatenate the two words key and word'),

];
