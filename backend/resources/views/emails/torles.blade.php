<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiók törlés</title>
</head>
<body>
<h1>Kedves {{ $customer->first_name }}!</h1>
<p>Biztos hogy törli a fiókját?</p>
<a href="http://localhost:3000/delete/{{ $id }}">Fiók törlése</a>
<p>Ha nem ön szerette volna törölni a fiókját, kérlek ignoráld ezt az emailt.</p>
</body>
</html>
