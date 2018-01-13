<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Default.Master" AutoEventWireup="true" CodeBehind="SingIn.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.SingIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    
    <!-- Container (TOUR Section) -->
    <div id="SingIN" class="bg-1">
        <div class="container text-center">
            <h3 class="text-center">WELCOME TO E-COMMERCE SITE</h3>
            <p class="text-center">Login to your Account.<br>
                Remember to Get Best deals!</p>
            <p class="text-center">Connect with your <a href="Admin.aspx"><strong>Admin Account ?</strong></a></p>
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
                        <asp:TextBox ID="TxtPasswd" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtPasswd" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <asp:Label ID="LblMsg" runat="server" CssClass="control-label" ForeColor="Red"></asp:Label>

            <br />

            <asp:Button ID="BtnSingIn" CssClass="btn" runat="server" Text="Sign in" OnClick="BtnSingIn_Click" />
        </div>
    </div>

    
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
</asp:Content>
