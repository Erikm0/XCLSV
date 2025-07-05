<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiók Aktiválás</title>
</head>
<body>
<h1>Kedves {{ $customer->first_name }}!</h1>
<p>Gratulálunk a regisztrációhoz! Kérlek, kattints az alábbi linkre a fiókod aktiválásához:</p>
<a href="{{ url('http://localhost:3000/password-setup/' . $verificationToken) }}">Fiók Aktiválása</a>
<p>Ha nem regisztráltál, kérlek ignoráld ezt az emailt.</p>
</body>
</html>
