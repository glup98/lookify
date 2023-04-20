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
    <title>Your Songs</title>
</head>
<body>
    <!-- Links -->
    <a href="/dashboard/new">Add New</a>
    <a href="/dashboard/top">Top Songs</a>
    <!-- ... -->
    <!-- Bara de busqueda -->
    <nav class="navbar bg-light d-inline-block">
        <div class="container-fluid">
        <form:form action="/dashboard/search" class="d-flex" role="search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" name="artist">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form:form>
        </div>
    </nav>
    <!-- ... -->
    <h1>Songs</h1>
    <!-- Tabla Languages -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Rating</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${songs}" var="song">
                <tr>
                    <th scope="row"><a href="/dashboard/${song.id}"><c:out value="${song.title}"/></a></th>
                    <th scope="row"><c:out value="${song.rating}"/></th>
                    <th> 
                        <!-- Delete Button -->
                        <form class="d-inline-block" action="/dashboard/${song.id}" method="post">
                            <input type="hidden" name="_method" value="delete">
                            <input type="submit" value="Delete">
                        </form>
                        <!-- ... -->
                    </th>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>