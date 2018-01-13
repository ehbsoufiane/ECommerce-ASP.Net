<%@ Page Title="Products" Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Products.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Clients_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Products</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Images/Iphone7.jpg" alt="New York" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>IPHONE 7 Now in Product</h1>
                    <p>Buy online and get fast, free shipping.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/macbookpro-1.jpg" alt="Chicago" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>MacBook Pro</h1>
                    <p>A touch of genius.</p>
                </div>
            </div>

            <div class="item">
                <img src="Images/macbookpro-2.jpg" alt="Los Angeles" width="1200" height="700">
                <div class="carousel-caption">
                    <h1>MacBook Pro</h1>
                    <p>Pick up at the E-Commerce Store today, Buy online and pick up available items in an hour.</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="BtnPay" />--%>
            <%--            <asp:AsyncPostBackTrigger ControlID="BtnBuy" EventName="Click" />--%>
        </Triggers>
        <ContentTemplate>
            <div id="band" class="container">
                <h2 class="text-center">Buy Your Product Now.</h2>
                <br />
                <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
                <br />

                <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" GroupPlaceholderID="groupPlaceHolder1"
                    ItemPlaceholderID="itemPlaceHolder1">
                    <LayoutTemplate>
                        <div class="row text-center">
                            <table>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("URLImage") %>' alt="Product Image" Height="200" />
                                <asp:Label ID="LblDesignation" runat="server" Text='<%#Eval("Designation")%>' Font-Bold="true" />
                                <br />
                                <asp:HiddenField ID="HiddenField1" Value='<%# Eval("NumArticle") %>' runat="server" />
                                <asp:Label ID="LblPu" runat="server" Text='<%#Eval("Pu") + " DH"%>' Font-Bold="true" />
                                <br />
                                Quantité
                                <asp:DropDownList ID="TxtQte" runat="server">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Button ID="BtnBuy" OnClick="BtnBuy_Click" runat="server" CssClass="btn btn-sm" Text="Buy" Width="60%" OnClientClick="return confirm('Confirm : Pay your Purchase ?')" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <!-- Modal -->
            <%--    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4><span class="glyphicon glyphicon-lock"></span>Confirm purchase</h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span>Send To</label>
                        </div>
                        <asp:Button ID="BtnPay" OnClick="BtnPay_Click" CssClass="btn btn-block" runat="server" Text="Pay" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span>Cancel
                    </button>
                    <p>Need <a href="#contact" class="close">help?</a></p>
                </div>
            </div>
        </div>
    </div>--%>





            <!-- Container (Contact Section) -->
            <div id="contact" class="container">
                <h2 class="text-center">Contact</h2>
                <div class="row">
                    <div class="col-md-4">
                        <p><span class="glyphicon glyphicon-map-marker"></span>Marrakech, MA</p>
                        <p><span class="glyphicon glyphicon-phone"></span>Phone: +212 524000000</p>
                        <p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <input class="form-control" id="name" name="name" placeholder="Name" type="text">
                            </div>
                            <div class="col-sm-6 form-group">
                                <input class="form-control" id="email" name="email" placeholder="Email" type="email">
                            </div>
                        </div>
                        <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
                        <br>
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <button class="btn pull-right">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>



    <asp:SqlDataSource ID="ProductListeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Article] WHERE [NumArticle] = @NumArticle" InsertCommand="INSERT INTO [Article] ([NumArticle], [Designation], [URLImage], [Pu]) VALUES (@NumArticle, @Designation, @URLImage, @Pu)" SelectCommand="SELECT [NumArticle], [Designation], [URLImage], [Pu] FROM [Article]" UpdateCommand="UPDATE [Article] SET [Designation] = @Designation, [URLImage] = @URLImage, [Pu] = @Pu WHERE [NumArticle] = @NumArticle">
        <DeleteParameters>
            <asp:Parameter Name="NumArticle" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NumArticle" Type="Int32" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="URLImage" Type="String" />
            <asp:Parameter Name="Pu" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="URLImage" Type="String" />
            <asp:Parameter Name="Pu" Type="Double" />
            <asp:Parameter Name="NumArticle" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Client] WHERE [NumClient] = @NumClient" InsertCommand="INSERT INTO [Client] ([Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass]) VALUES (@Nom, @Prenom, @Adresse, @Ville, @Tel, @Login, @Pass)" SelectCommand="SELECT [NumClient], [Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass] FROM [Client]" UpdateCommand="UPDATE [Client] SET [Nom] = @Nom, [Prenom] = @Prenom, [Adresse] = @Adresse, [Ville] = @Ville, [Tel] = @Tel, [Login] = @Login, [Pass] = @Pass WHERE [NumClient] = @NumClient">
        <DeleteParameters>
            <asp:Parameter Name="NumClient" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nom" Type="String" />
            <asp:Parameter Name="Prenom" Type="String" />
            <asp:Parameter Name="Adresse" Type="String" />
            <asp:Parameter Name="Ville" Type="String" />
            <asp:Parameter Name="Tel" Type="Int32" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Pass" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nom" Type="String" />
            <asp:Parameter Name="Prenom" Type="String" />
            <asp:Parameter Name="Adresse" Type="String" />
            <asp:Parameter Name="Ville" Type="String" />
            <asp:Parameter Name="Tel" Type="Int32" />
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Pass" Type="String" />
            <asp:Parameter Name="NumClient" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="CommandesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Commande] WHERE [NumCmd] = @NumCmd" InsertCommand="INSERT INTO [Commande] ([dateCmd], [NumClient], [NumArticle], [QteArticle]) VALUES (@dateCmd, @NumClient, @NumArticle, @QteArticle)" SelectCommand="SELECT [NumCmd], [dateCmd], [NumClient], [NumArticle], [QteArticle] FROM [Commande]" UpdateCommand="UPDATE [Commande] SET [dateCmd] = @dateCmd, [NumClient] = @NumClient, [NumArticle] = @NumArticle, [QteArticle] = @QteArticle WHERE [NumCmd] = @NumCmd">
        <DeleteParameters>
            <asp:Parameter Name="NumCmd" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="dateCmd" />
            <asp:Parameter Name="NumClient" Type="Int32" />
            <asp:Parameter Name="NumArticle" Type="Int32" />
            <asp:Parameter Name="QteArticle" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="dateCmd" />
            <asp:Parameter Name="NumClient" Type="Int32" />
            <asp:Parameter Name="NumArticle" Type="Int32" />
            <asp:Parameter Name="QteArticle" Type="Int32" />
            <asp:Parameter Name="NumCmd" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <!-- Add Google Maps -->
    <div id="googleMap"></div>
    <script>
        function myMap() {
            var myCenter = new google.maps.LatLng(31.62196, -8.04704);
            var mapProp = { center: myCenter, zoom: 14, scrollwheel: false, draggable: false, mapTypeId: 'hybrid' };
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            var marker = new google.maps.Marker({ position: myCenter });
            marker.setMap(map);
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKQSxsyNq91yDKVj2Ak-kCyfexcr1s6GI&callback=myMap"></script>

</asp:Content>
