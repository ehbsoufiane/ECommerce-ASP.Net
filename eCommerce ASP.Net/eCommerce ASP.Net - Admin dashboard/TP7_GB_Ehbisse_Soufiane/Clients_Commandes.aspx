<%@ Page Title="Commandes" Language="C#" MasterPageFile="~/Site_Clients.Master" AutoEventWireup="true" CodeBehind="Clients_Commandes.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Clients_Commandes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Commandes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GlobalContent" runat="server">
    
        <style>
            body{
                background-color:#2d2d30;
            }
        .jumbotron{
    margin-top:8% !important;
}
    </style>
    <div class="jumbotron container">
        
        <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
    <asp:HiddenField ID="HiddenField1" runat="server" />

    <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" DataSourceID="ListCmdDataSource" AutoGenerateColumns="False" DataKeyNames="NumCmd" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="NumClient" HeaderText="N° Client" SortExpression="NumClient" />
            <asp:BoundField DataField="NumCmd" HeaderText="N° Commande" InsertVisible="False" ReadOnly="True" SortExpression="NumCmd" />
            <asp:BoundField DataField="NumArticle" HeaderText="N° Article" SortExpression="NumArticle" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
            <asp:BoundField DataField="dateCmd" HeaderText="Date Commande" SortExpression="dateCmd" />
            <asp:BoundField DataField="QteArticle" HeaderText="Quantite Article" SortExpression="QteArticle" />
            <asp:BoundField DataField="Pu" HeaderText="Prix UT" SortExpression="Pu" />
            <asp:BoundField DataField="Prix TTC" HeaderText="Prix TTC" ReadOnly="True" SortExpression="Prix TTC" />
        </Columns>
        </asp:GridView>

    </div>
    <asp:SqlDataSource ID="ListCmdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Commande] WHERE [NumCmd] = @NumCmd" InsertCommand="INSERT INTO [Commande] ([dateCmd], [NumClient], [NumArticle], [QteArticle]) VALUES (@dateCmd, @NumClient, @NumArticle, @QteArticle)" SelectCommand="SELECT Commande.NumClient,NumCmd,Commande.NumArticle,Designation,dateCmd,QteArticle,Pu,Pu * QteArticle 'Prix TTC'
FROM Commande JOIN Client
ON Commande.NumClient = Client.NumClient
JOIN Article
ON Commande.NumArticle = Article.NumArticle
WHERE Commande.NumClient = @NumClient" UpdateCommand="UPDATE [Commande] SET [dateCmd] = @dateCmd, [NumClient] = @NumClient, [NumArticle] = @NumArticle, [QteArticle] = @QteArticle WHERE [NumCmd] = @NumCmd" OnSelected="ListCmdDataSource_Selected">
        <DeleteParameters>
            <asp:Parameter Name="NumCmd" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="dateCmd" />
            <asp:Parameter Name="NumClient" Type="Int32" />
            <asp:Parameter Name="NumArticle" Type="Int32" />
            <asp:Parameter Name="QteArticle" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenField1" Name="NumClient" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="dateCmd" />
            <asp:Parameter Name="NumClient" Type="Int32" />
            <asp:Parameter Name="NumArticle" Type="Int32" />
            <asp:Parameter Name="QteArticle" Type="Int32" />
            <asp:Parameter Name="NumCmd" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Client] WHERE [NumClient] = @NumClient" InsertCommand="INSERT INTO [Client] ([Login]) VALUES (@Login)" SelectCommand="SELECT [NumClient], [Login] FROM [Client]" UpdateCommand="UPDATE [Client] SET [Login] = @Login WHERE [NumClient] = @NumClient">
        <DeleteParameters>
            <asp:Parameter Name="NumClient" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Login" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="NumClient" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
