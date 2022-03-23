<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container-fluid back-img">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class= "card mt-5">
                        <div class="card-header text-center text-white bg-dark">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Registration</h4>
                        </div>


                        <%
                            String regm = (String) session.getAttribute("msg");
                            session.removeAttribute("msg");
                            if (regm == "success") {
                        %>
                        <div class="alert alert-success" role="alert">
                            Registration Successfull!Click here to <a href="login.jsp">Login</a>
                        </div>
                        <%
                        } else if(regm == "fail"){
                        %>
                        <div class="alert alert-danger" role="alert">
                            Oops! Something Went Wrong on Server
                        </div>
                        <%
                            }
                        %>


                        <div class="card-body">
                            <form action="registerServlet" method="post">
                                <div class="mb-3">
                                    <label for="inputName" class="form-label">Full Name</label>
                                    <input type="text" required="required" class="form-control" id="inputName" name="username" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" required="required" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" required="required" class="form-control" name="password" id="exampleInputPassword1">
                                </div>
                                <div class="d-grid gap-2"> 
                                    <button type="submit" class="btn btn-dark">Register</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>

    </body>
</html>
