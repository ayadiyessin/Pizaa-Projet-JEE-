<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/darkly/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/darkly/variables.scss" rel="stylesheet">
</head>
<body>
	<h1> Liste des pizza</h1>
	<div class="container mt-4">
		<c:if test="${message!='' }" >
			<div class="alert alert-dismissible alert-secondary">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong> ${message} </strong>
			</div>
		</c:if>
		<table class="table table-hover">
			<tr class="table-primary">
				<th>Id</th>
				<th>Image</th>
				<th>Nom</th>
				<th>Prix</th>
				<th>Actions</th>
			</tr>

			<c:forEach items="${listPizza}" var="p" varStatus="status">
				<tr>
					<td> ${p.id_pizza} </td>
					<td><img src='${p.image}'  style="heigth:55px;"></td> 
					<td>${p.nom}</td> 
					<td>${p.prix}</td>
					<td></td>
				</tr>
			</c:forEach>
</table>
</div>
</body>
</html>