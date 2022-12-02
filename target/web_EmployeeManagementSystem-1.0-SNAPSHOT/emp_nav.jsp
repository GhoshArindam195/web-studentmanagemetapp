<nav class="navbar navbar-expand-lg navbar-dark bg-custom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><b>Employee Management App</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <!--                <li class="nav-item" >
                                    <a class="nav-link mr-2" href="logoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
                                </li>-->

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Emp <%= user.getUser_name().split(" ")[0]%>
                    </a>
                    <ul class="dropdown-menu p-0 m-0">
                        <li>
                            <a class="nav-link mr-2 bg-light text-danger" href="logoutServlet"><span class="fa fa-sign-out"></span><b>Logout</b></a>
                            <!--<hr>-->
                            <a class="nav-link mr-2 bg-dark text-warning" data-bs-toggle="modal" data-bs-target="#change_pwd" href="#"><span class="fa fa-sign-out"></span><b>Change Password</b></a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</nav>