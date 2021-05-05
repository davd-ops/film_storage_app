<?php


class ApiQuery
{

    function callApi($title)
    {
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => "https://movie-database-imdb-alternative.p.rapidapi.com/?s={$title}&page=1&r=json",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "x-rapidapi-host: movie-database-imdb-alternative.p.rapidapi.com",
                "x-rapidapi-key: 48977c75b7mshf9ec82ca69c6e31p13758djsn286d7e862508"
            ],
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            $json = json_decode($response);
            foreach ($json->Search as $item) {
                echo $item->Title . "<br>";
            }
        }
    }
}