<%@ Page Title="Account" Language="C#" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Account.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Clients_Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Account</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    
    <style>
                    body{
                background-color:#2d2d30;
            }
        tr:nth-last-child(1) a {
            padding: 8px 30px;
            background-color: #333;
            color: #f1f1f1;
            border-radius: 0;
            transition: .2s;
            width: 200px;
            min-width: 100px;
        }
        .jumbotron{
    margin-top:8% !important;
}
    </style>

    <div class="jumbotron container">
        <asp:DetailsView ID="DetailsView1" GridLines="None" CssClass="table table-hover" runat="server" Width="100%" AutoGenerateRows="False" DataKeyNames="NumClient" DataSourceID="ClientsDataSource">
            <Fields>
                <asp:BoundField DataField="NumClient" HeaderText="N° Client" InsertVisible="False" ReadOnly="True" SortExpression="NumClient" />
                <asp:TemplateField HeaderText="FirstName" SortExpression="Nom">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Nom") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nom") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName" SortExpression="Prenom">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("Prenom") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Prenom") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Prenom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Adresse">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("Adresse") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Adresse") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Adresse") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="Ville">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="ListeVilleDataSource" DataTextField="NomVille" DataValueField="NomVille" SelectedValue='<%# Bind("Ville") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ListeVilleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" SelectCommand="SELECT [NomVille] FROM [ListeVille]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Ville") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ville") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Tel">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Bind("Tel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Login" SortExpression="Login">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" ReadOnly="true" Text='<%# Bind("Login") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Login") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Login") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password" SortExpression="Pass">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Text='<%# Bind("Pass") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Pass") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Pass") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>



    <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" SelectCommand="SELECT [NumClient], [Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass] FROM [Client]" DeleteCommand="DELETE FROM [Client] WHERE [NumClient] = @NumClient" FilterExpression="Login = '{0}'" InsertCommand="INSERT INTO [Client] ([Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass]) VALUES (@Nom, @Prenom, @Adresse, @Ville, @Tel, @Login, @Pass)" UpdateCommand="UPDATE [Client] SET [Nom] = @Nom, [Prenom] = @Prenom, [Adresse] = @Adresse, [Ville] = @Ville, [Tel] = @Tel, [Login] = @Login, [Pass] = @Pass WHERE [NumClient] = @NumClient">
        <DeleteParameters>
            <asp:Parameter Name="NumClient" Type="Int32" />
        </DeleteParameters>
        <FilterParameters>
            <asp:SessionParameter Name="Pseudo" SessionField="Pseudo" />
        </FilterParameters>
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
