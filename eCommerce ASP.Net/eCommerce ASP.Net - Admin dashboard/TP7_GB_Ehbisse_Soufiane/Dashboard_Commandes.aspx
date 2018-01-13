<%@ Page Title="" Language="C#" MasterPageFile="~/Site_Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard_Commandes.aspx.cs" Inherits="TP7_GB_Ehbisse_Soufiane.Dashboard_Commandes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .jumbotron {
            margin-top: 8% !important;
        }
    </style>

    <div class="jumbotron container">
        
        <div class="row text-center">
            <div class="col-md-3">
                Search Option :<asp:DropDownList ID="DropDownList1" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="1">Num Commande</asp:ListItem>
                    <asp:ListItem Value="2">Date Commande</asp:ListItem>
                    <asp:ListItem Value="3">Between two Date</asp:ListItem>
                    <asp:ListItem Value="4">Num Client</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="div1" runat="server" class="col-sm-4">
                N° Commande :<asp:TextBox ID="TxtNumCmd" TextMode="Number" CssClass="form-control" Placeholder="'Enter Num Commande'" runat="server"></asp:TextBox>
            </div>
            <div id="div2" runat="server" class="col-sm-4" visible="false">
                Commande Date :<asp:TextBox ID="TxtDate" CssClass="form-control" Placeholder="'Enter Date Commande'" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDate" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
            </div>
            <div id="div3" runat="server" class="col-sm-4" visible="false">
                Start Date :<asp:TextBox ID="TxtDate1" CssClass="form-control" Placeholder="'Enter Date Commande'" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtDate1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Start Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate1" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
                <br />
                End Date :<asp:TextBox ID="TxtDate2" CssClass="form-control" Placeholder="'Enter Date Commande'" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtDate2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid End Date" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDate2" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>
            </div>
            <div id="div4" runat="server" class="col-sm-4" visible="false">
                N° Client :<asp:TextBox ID="TxtNumClient" TextMode="Number" CssClass="form-control" Placeholder="'Enter Date Client'" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3 pull-right">
                <br />
                <asp:Button ID="BtnSearch" CssClass="btn" runat="server" Text="Searsh" OnClick="BtnSearch_Click"  />
            </div>
        </div>
                <br />
                <asp:Label ID="LblMsg" CssClass="text-center center-block" runat="server" Text=""></asp:Label>
<br />
        <asp:GridView ID="GridView1" GridLines="None" CssClass="table table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="NumCmd" DataSourceID="CommandesListeDataSource" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="NumCmd" HeaderText="N° Commande" InsertVisible="False" ReadOnly="True" SortExpression="NumCmd" />
                <asp:BoundField DataField="dateCmd" HeaderText="Date Commande" SortExpression="dateCmd" />
                <asp:BoundField DataField="NumClient" HeaderText="N° Client" SortExpression="NumClient" />
                <asp:BoundField DataField="NumArticle" HeaderText="N° Article" SortExpression="NumArticle" />
                <asp:BoundField DataField="QteArticle" HeaderText="Qantite Article" SortExpression="QteArticle" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="CommandesListeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GestionVentes %>" DeleteCommand="DELETE FROM [Commande] WHERE [NumCmd] = @NumCmd" InsertCommand="INSERT INTO [Commande] ([dateCmd], [NumClient], [NumArticle], [QteArticle]) VALUES (@dateCmd, @NumClient, @NumArticle, @QteArticle)" SelectCommand="SELECT [NumCmd], [dateCmd], [NumClient], [NumArticle], [QteArticle] FROM [Commande]" UpdateCommand="UPDATE [Commande] SET [dateCmd] = @dateCmd, [NumClient] = @NumClient, [NumArticle] = @NumArticle, [QteArticle] = @QteArticle WHERE [NumCmd] = @NumCmd" OnSelected="CommandesListeDataSource_Selected">
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

    </div>
</asp:Content>
