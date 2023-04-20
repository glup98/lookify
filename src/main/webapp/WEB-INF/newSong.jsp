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
    <title>Add Song</title>
</head>
<body>
    <a href="/dashboard">Dashboard</a>

    <h1>Add Song</h1>
    <!-- Formulario NewLanguages -->
    <form:form action="/dashboard/new" method="post" modelAttribute="song">
        <p>
            <form:label path="title">Title</form:label>
            <form:errors path="title"/>
            <form:input path="title"/>
        </p>
        <p>
            <form:label path="artist">Artist</form:label>
            <form:errors path="artist"/>
            <form:input path="artist"/>
        </p>
        <p>
            Rating 
            <form:select path="rating">  
                <form:option value="1" label="1"/>  
                <form:option value="2" label="2"/>  
                <form:option value="3" label="3"/>  
                <form:option value="4" label="4"/>
                <form:option value="5" label="5"/>  
                <form:option value="6" label="6"/>  
                <form:option value="7" label="7"/>
                <form:option value="8" label="8"/>  
                <form:option value="9" label="9"/>  
                <form:option value="10" label="10"/>  
            </form:select>
        </p> 
        <input type="submit" value="Add Song"/>
    </form:form>  
    <!-- ... -->
</body>
</html>