<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard_Clients.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Dashboard_Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .jumbotron {
            margin-top: 8% !important;
        }
    </style>

    <div class="jumbotron container">

        <asp:TextBox ID="TxtSearch" CssClass="form-control pull-right" Placeholder="'Nom', 'Prenom', 'Ville', ...'" Height="42px" Width="30%" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" DataSourceID="ClientsDataSource" AutoGenerateColumns="False" DataKeyNames="NumClient" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="NumClient" HeaderText="N° Client" InsertVisible="False" ReadOnly="True" SortExpression="NumClient" />
                <asp:BoundField DataField="Nom" HeaderText="FirstName" SortExpression="Nom" />
                <asp:BoundField DataField="Prenom" HeaderText="LastName" SortExpression="Prenom" />
                <asp:BoundField DataField="Adresse" HeaderText="Address" SortExpression="Adresse" />
                <asp:BoundField DataField="Ville" HeaderText="City" SortExpression="Ville" />
                <asp:BoundField DataField="Tel" HeaderText="Phone" SortExpression="Tel" />
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                <asp:BoundField DataField="Pass" HeaderText="Password" SortExpression="Pass" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ClientsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Client] WHERE [NumClient] = @original_NumClient" InsertCommand="INSERT INTO [Client] ([Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass]) VALUES (@Nom, @Prenom, @Adresse, @Ville, @Tel, @Login, @Pass)" SelectCommand="SELECT [NumClient], [Nom], [Prenom], [Adresse], [Ville], [Tel], [Login], [Pass] FROM [Client]
                            WHERE NumClient LIKE @SearchValue + '%'
                            OR Nom LIKE @SearchValue + '%'
                            OR Prenom LIKE @SearchValue + '%'
                            OR Adresse LIKE @SearchValue + '%'
                            OR Ville LIKE @SearchValue + '%'
                            OR Tel LIKE @SearchValue + '%'
                            OR Login LIKE @SearchValue + '%'
                            OR Pass LIKE @SearchValue + '%'"
            UpdateCommand="UPDATE [Client] SET [Nom] = @Nom, [Prenom] = @Prenom, [Adresse] = @Adresse, [Ville] = @Ville, [Tel] = @Tel, [Login] = @Login, [Pass] = @Pass WHERE [NumClient] = @original_NumClient" OldValuesParameterFormatString="original_{0}" OnSelected="ClientsDataSource_Selected">
            <DeleteParameters>
                <asp:Parameter Name="original_NumClient" Type="Int32" />
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
            <SelectParameters>
                <asp:ControlParameter ControlID="TxtSearch" DefaultValue="%" Name="SearchValue" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nom" Type="String" />
                <asp:Parameter Name="Prenom" Type="String" />
                <asp:Parameter Name="Adresse" Type="String" />
                <asp:Parameter Name="Ville" Type="String" />
                <asp:Parameter Name="Tel" Type="Int32" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
                <asp:Parameter Name="original_NumClient" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <%--    <script type="text/javascript">
        function Search_Gridview(strKey, strGV) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById(strGV);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }    
</script>--%>
</asp:Content>

