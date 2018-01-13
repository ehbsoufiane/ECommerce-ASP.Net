<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8"/>
    <link href="Images/favicon.ico" rel="icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"/>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/Styles.css" rel="stylesheet" />
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="">E-Commerce</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a><span class="badge"><asp:Label ID="ActifsUsers" runat="server" Text="ADMIN PAGE" ForeColor="Lime"></asp:Label></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>




        <!-- Container (TOUR Section) -->
        <div id="SingIN" class="bg-1">
            <div class="container text-center">
                <h3 class="text-center">RESERVED TO ADMIN ONLY</h3>
                <p class="text-center">
                    Lorem ipsum .<br>
                </p>
            <p class="text-center">Connect with your <a href="SingIn.aspx"><strong>Client Account ?</strong></a></p>
                <div class="row">
                    <div class="col-md-3">
                        <label class="control-label">Login</label>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group label-floating">
                            <asp:TextBox ID="TxtLogin" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLogin" ErrorMessage="Required Field" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label class="control-label">Password</label>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group label-floating">
                            <asp:TextBox ID="TxtPasswd" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtPasswd" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <asp:Label ID="LblMsg" runat="server" CssClass="control-label" ForeColor="Red"></asp:Label>

                <br />

                <asp:Button ID="BtnSingIn" CssClass="btn" runat="server" Text="Connexion" OnClick="BtnSingIn_Click" />
            </div>
        </div>


        <!-- Footer -->
        <footer class="text-center">
            <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <br/>
            <br/>
            <p>Contact Developper <a href="mailto:ehbissesoufian@gmail.com" data-toggle="tooltip" title="Contact Developper">ehbissesoufian@gmail.com</a></p>
        </footer>

    </form>
</body>
</html>
