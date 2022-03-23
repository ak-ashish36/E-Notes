<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container-fluid back-img">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class= "card mt-5">
                        <div class="card-header text-center text-white bg-dark">
                            <i class="fa fa-sign-in fa-2x" aria-hidden="true"></i>
                            <h4>Login</h4>
                        </div>

                        <%
                            String logm = (String) session.getAttribute("msg");
                            session.removeAttribute("msg");
                            if (logm == "fail") {
                        %>
                        <div class="alert alert-danger" role="alert">
                            Invalid Credentials 
                        </div>
                        <%
                        }else if(logm=="login"){
                        %>
                        <div class="alert alert-danger" role="alert">
                            Please Login First
                        </div>
                        <%
                        } else if (logm == "logutsuccess") {
                        %>
                        <div class="alert alert-success" role="alert">
                            Logout Successfull
                        </div>
                        <%
                        }
                        %>

                        <div class="card-body">
                            <form action="loginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" class="form-control" name="useremail" id="exampleInputEmail1" aria-describedby="emailHelp">                                        </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" name="userpassword" id="exampleInputPassword1">
                                </div>
                                <div class="d-grid gap-2"> 
                                    <button type="submit" class="btn btn-dark">Login</button>
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
