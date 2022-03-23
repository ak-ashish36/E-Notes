<%@page import="com.User.userDetails"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">E Notes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="welcome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addNotes.jsp">Add Notes</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="getnotesServlet">Show Notes</a>
                    </li>
                </ul>

                <%
                    userDetails user = (userDetails) session.getAttribute("user_details");
                    if (user != null) {
                %>
                <a href="#" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" ><i class="fa fa-user" aria-hidden="true"></i> <%=user.getName()%></a>
                <a href="logout" class="btn btn-outline-success"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                <%
                } else {
                %>             
                <a class="btn btn-outline-success" href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
                <a class="btn btn-outline-success" href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
                <%
                    }
                %>
            </div>  
        </div>
    </nav>
    <%
        if (user != null) {
    %>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Your Info</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <i class="fa fa-user fa-3x"></i>
                        <h5><%=user.getName()%></h5>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>User Id</th>
                                    <td><%=user.getId()%></td>
                                </tr>
                                <tr>
                                    <th>Full Name</th>
                                    <td><%=user.getName()%></td>
                                </tr>
                                <tr>
                                    <th>Email-Id</th>
                                    <td><%=user.getEmail()%></td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

