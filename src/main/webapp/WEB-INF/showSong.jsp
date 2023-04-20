<%@ page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title><c:out value="${song.title}"/></title>
</head>
<body>
    <div class="border border-dark d-inline-block justify-content-center">
        <p class="fs-3">Title: <c:out value="${song.title}"/></p>
        <p class="fs-3">Artist: <c:out value="${song.artist}"/></p>
        <p class="fs-3">Rating: <c:out value="${song.rating}"/></p>
        <form class="d-inline-block" action="/dashboard/${song.id}" method="post">
            <input type="hidden" name="_method" value="delete">
            <input type="submit" value="Delete">
        </form>
    </div>
    <a id="dashboard" href="/dashboard">Dashboard</a>
</body>
</html>