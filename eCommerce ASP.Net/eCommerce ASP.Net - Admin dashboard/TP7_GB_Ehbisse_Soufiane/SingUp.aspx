<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Default.Master" AutoEventWireup="true" CodeBehind="SingUp.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.SingUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    

    <!-- Container (TOUR Section) -->
    <div id="SingUp" class="bg-1">
        <div class="container text-center">
            <h3 class="text-center">WELCOME TO E-COMMERCE SITE</h3>
            <p class="text-center">
                Create your own Account.<br>
                Remember to book your tickets!
            </p>
            <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Login</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtLogin" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtLogin" ErrorMessage="Required Field" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TxtLogin" OnServerValidate="TxtLogin_ServerValidate" ErrorMessage="Pseudo Exist déja" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
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

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Retape Password</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtPasswdR" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords are different" ControlToCompare="TxtPasswd" ControlToValidate="TxtPasswdR" ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">First Name</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtNom" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtNom" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Last Name</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtPrenom" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtPrenom" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Address</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtAdresse" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtAdresse" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">City</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:DropDownList ID="ListeVille" CssClass="form-control" runat="server" DataSourceID="ListeVilleDataSource" DataTextField="NomVille" DataValueField="NomVille"></asp:DropDownList>
                        <br />
                        <asp:SqlDataSource ID="ListeVilleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" SelectCommand="SELECT [NomVille] FROM [ListeVille]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <label class="control-label">Phone</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group label-floating">
                        <asp:TextBox ID="TxtTele" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtTele" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <br />

            <asp:Button ID="BtnSingUp" runat="server" CssClass="btn" Text="Sing up" OnClick="BtnSingUp_Click" />
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
