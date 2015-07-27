<%@ Page Title="Food Tracker | Fit and Fun" Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="food_tracker.aspx.cs" Inherits="Assignment_2.food_tracker" %>

<%@ Register Src="~/auth.ascx" TagPrefix="uc1" TagName="auth" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:auth runat="server" ID="auth" />
    <div class="main_content">
        <h1>Food Tracker</h1>
        <div class=" text-center padding_05em">
            <a href="food_input.aspx" class="btn btn-success">Add a Food Entry</a>
        </div>
        <asp:GridView runat="server" ID="grdFood" CssClass="table table-striped table-hover" AutoGenerateColumns="false" OnRowDeleting="grdFood_RowDeleting" DataKeyNames="food_id">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="User ID" Visible="false" />
                <asp:BoundField DataField="food_id" HeaderText="Food ID" Visible="false" />
                <asp:BoundField DataField="food_name" HeaderText="Name of Food" />
                <asp:BoundField DataField="food_calories" HeaderText="Calories" />
                <asp:BoundField DataField="food_date" HeaderText="Date of Entry" DataFormatString="{0:MM-dd-yyyy}" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" DataNavigateUrlFields="food_id" DataNavigateUrlFormatString="food_input.aspx?food_id={0}" ControlStyle-CssClass="btn btn-primary" />
                <asp:CommandField ShowDeleteButton="true" DeleteText="Delete" HeaderText="Delete" ControlStyle-CssClass="btn btn-danger" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
